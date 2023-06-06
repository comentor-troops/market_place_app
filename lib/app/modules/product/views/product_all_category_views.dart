import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import '../../../components/components_dialog_cart.dart';
import '../../../data/model/product_response_model.dart';
import '../../../theme/my_text_theme.dart';
import '../../../theme/utils/my_colors.dart';
import '../widgets/product_card_item_widget.dart';
import '../../responsive/responsive_layout.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_header_widget.dart';
import '../widgets/product_search_widget.dart';

class AllCategoryViews extends GetView<ProductController> {
  const AllCategoryViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPhone = ResponsiveLayout.isPhone(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isPhone ? const SizedBox.shrink() : const ProductHeaderWidget(),
        isPhone ? const SizedBox.shrink() : const SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductSearchWidget(
              constraints: const BoxConstraints(
                minHeight: 50,
                minWidth: 300,
                maxWidth: 500,
              ),
              controller: controller.searchController,
              onChanged: (query) => query.isEmpty
                  ? controller.search.clear()
                  : controller.getSearch(query),
            ),
            Obx(
              () {
                final isLoading = controller.isLoadingProduct.value;
                List<Data> products = controller.search.isNotEmpty
                    ? controller.search
                    : controller.products ?? [];

                return AnimationLimiter(
                  child: GridView.builder(
                    gridDelegate: isPhone || isTablet
                        ? SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isPhone || isTablet ? 1 : 2,
                            childAspectRatio: 2 / 1.2,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24)
                        : const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 260,
                            maxCrossAxisExtent: 500,
                            crossAxisSpacing: 24,
                            childAspectRatio: 1,
                            mainAxisSpacing: 24),
                    itemCount: controller.paginate?.perPage ?? 0,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 26),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      if (isLoading) {
                        return const CupertinoActivityIndicator();
                      } else {
                        var productItem = products[i];
                        final animationDelay =
                            const Duration(milliseconds: 200) * i;
                        const animationDuration = Duration(milliseconds: 500);
                        return AnimationConfiguration.staggeredGrid(
                          position: i,
                          delay: animationDelay,
                          duration: animationDuration,
                          columnCount: 2,
                          child: FadeInAnimation(
                            delay: animationDelay,
                            duration: animationDuration,
                            child: ProductCardItemWidget(
                              contentColor: MyColors.getRandomColor(i),
                              productId: products[i].id.toString(),
                              productLogo: productItem.productLogo!,
                              productTitle: productItem.productTitle!,
                              productPriceFormat:
                                  productItem.productPriceFormat!,
                              onPressedLivePreview: () {},
                              onPressedCart: () {
                                Get.dialog(
                                  Dialog(
                                    child: ComponentsDialogCart(
                                      productLogo: productItem.productLogo!,
                                      productTitle: productItem.productTitle!,
                                      productPrice:
                                          productItem.productPriceFormat!,
                                      productAuthor: productItem.productAuthor!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Previous',
                  alignment: Alignment.center,
                  splashRadius: 18,
                  onPressed: controller.goToPreviousPage,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.paginate!.lastPage,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final pageNumber = index + 1;
                      return GestureDetector(
                        onTap: () {
                          controller.goToPage(pageNumber);
                        },
                        child: Obx(
                          () {
                            return Container(
                              width: 30,
                              margin: const EdgeInsets.all(4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    pageNumber == controller.currentPage.value
                                        ? Colors.purple
                                        : Colors.grey[300],
                              ),
                              child: Text(
                                pageNumber.toString(),
                                style: MyTextTheme.defaultStyle(
                                  color:
                                      pageNumber == controller.currentPage.value
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  tooltip: 'Next',
                  alignment: Alignment.center,
                  splashRadius: 18,
                  onPressed: controller.goToNextPage,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
