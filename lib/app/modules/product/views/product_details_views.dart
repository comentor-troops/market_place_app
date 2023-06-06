import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../theme/my_text_theme.dart';
import '../../authentication/authentication_page.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/responsive_layout_controller.dart';
import '../../responsive/widgets/responsive_footer_widget.dart';
import '../../responsive/widgets/responsive_header_widget.dart';
import '../controllers/product_controller.dart';

class ProductDetailsViews extends GetView<ProductController> {
  const ProductDetailsViews({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getDetailsProduct(Get.parameters["id"]);
    final responsiveController = Get.find<ResponsiveLayoutController>();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Obx(
          () => controller.isLoadingDetailsProduct.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : Scaffold(
                  key: responsiveController.scaffoldKey,
                  appBar: const ResponsiveHeaderWidget(),
                  endDrawer: const AuthenticationPage(),
                  body: SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              height: 260,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
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
                                        controller.detailsProduct!.productLogo
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 26),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .detailsProduct!.productTitle!,
                                          style: MyTextTheme.defaultStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Flexible(
                                          child: Text(
                                            controller.detailsProduct!
                                                .productDescription!,
                                            style: MyTextTheme.defaultStyle(
                                              fontWeight: 16,
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
                                      controller.detailsProduct!.productAuthor!,
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
                            horizontal:
                                ResponsiveLayout.isTablet(context) ? 50 : 100,
                            vertical: 26,
                          ),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisExtent: 620,
                              maxCrossAxisExtent: 310,
                              crossAxisSpacing: 38,
                              childAspectRatio: 1,
                              mainAxisSpacing: 38,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, i) {
                                var screenshoot =
                                    controller.detailsProductScreenshot![i];

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      screenshoot.productScreenshot!,
                                      alignment: Alignment.topCenter,
                                      width: 320,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              },
                              childCount:
                                  controller.detailsProductScreenshot!.length,
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: ResponsiveFooterWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
