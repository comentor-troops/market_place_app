import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../theme/my_text_theme.dart';
import '../../authentication/authentication_page.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/widgets/responsive_footer_widget.dart';
import '../../responsive/widgets/responsive_header_widget.dart';
import '../controllers/product_controller.dart';

class ProductDetailsViews extends GetView<ProductController> {
  const ProductDetailsViews({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getDetailsProduct(Get.parameters["id"]);

    return LayoutBuilder(
      builder: ((context, constraints) {
        var isPhone = ResponsiveLayout.isPhone(context);
        var isTablet = ResponsiveLayout.isPhone(context);

        return Obx(
          () {
            if (controller.isLoadingDetailsProduct.value) {
              return Container(
                color: Colors.grey[50],
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            } else {
              var details = controller.detailsProduct!;
              var screenshoot = controller.detailsProductScreenshot!;
              return Scaffold(
                appBar:
                    ResponsiveHeaderWidget(context: context, useLeading: true),
                endDrawer: const AuthenticationPage(),
                body: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Container(
                            height: 260,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            color: Colors.grey[50],
                            child: Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.network(
                                      details.productLogo.toString(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 26),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        details.productTitle!,
                                        style: MyTextTheme.defaultStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Flexible(
                                        child: Text(
                                          details.productDescription!,
                                          style: MyTextTheme.defaultStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            color: Colors.grey[100],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.green,
                                ),
                                const SizedBox(width: 26),
                                Flexible(
                                  child: Text(
                                    details.productAuthor!,
                                    style: MyTextTheme.defaultStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet || isPhone ? 50 : 100,
                          vertical: 26,
                        ),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: isTablet ? 600 : 570,
                            maxCrossAxisExtent: isPhone ? 450 : 310,
                            crossAxisSpacing: 38,
                            childAspectRatio: 1,
                            mainAxisSpacing: 38,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            childCount: screenshoot.length,
                            (context, i) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      content: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          screenshoot[i].productScreenshot!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    screenshoot[i].productScreenshot!,
                                    alignment: Alignment.topCenter,
                                    width: 320,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: ResponsiveFooterWidget(),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
