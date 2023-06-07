import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import '../../../components/components_dialog_cart.dart';
import '../../../theme/my_text_theme.dart';
import '../../../theme/utils/my_colors.dart';
import '../widgets/product_card_item_widget.dart';
import '../../responsive/responsive_layout.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_header_widget.dart';
import '../widgets/product_pagination_icon_button_widget.dart';
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
            Obx(
              () => ProductSearchWidget(
                constraints: const BoxConstraints(
                  minHeight: 50,
                  minWidth: 300,
                  maxWidth: 500,
                ),
                controller: controller.searchController.value,
                onChanged: (query) => query.isEmpty
                    ? controller.search.clear()
                    : controller.getSearch(query),
              ),
            ),
            const SizedBox(height: 26),
            Obx(
              () {
                final isLoadingSearch = controller.isLoadingSearch.value;
                final isLoadingproducts = controller.isLoadingProduct.value;
                final isEmptyText =
                    controller.searchController.value.text.isEmpty;
                if (isLoadingSearch || isEmptyText || isLoadingproducts) {
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
                      itemCount: controller.perPage.value,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 26),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Obx(
                          () {
                            if (controller.isLoadingProduct.value) {
                              return const CupertinoActivityIndicator();
                            } else if (controller.products!.isEmpty) {
                              return const SizedBox();
                            } else {
                              return AnimationConfiguration.staggeredGrid(
                                position: i,
                                columnCount: 2,
                                child: FadeInAnimation(
                                  child: ProductCardItemWidget(
                                    contentColor: MyColors.getRandomColor(i),
                                    productId:
                                        controller.products![i].id.toString(),
                                    productLogo:
                                        controller.products![i].productLogo!,
                                    productTitle:
                                        controller.products![i].productTitle!,
                                    productPriceFormat: controller
                                        .products![i].productPriceFormat!,
                                    onPressedLivePreview: () {},
                                    onPressedCart: () {
                                      Get.dialog(
                                        Dialog(
                                          child: ComponentsDialogCart(
                                            productLogo: controller
                                                .products![i].productLogo!,
                                            productTitle: controller
                                                .products![i].productTitle!,
                                            productPrice: controller
                                                .products![i]
                                                .productPriceFormat!,
                                            productAuthor: controller
                                                .products![i].productAuthor!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  );
                } else {
                  var search = controller.search;
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
                      itemCount: controller.search.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 26),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return AnimationConfiguration.staggeredGrid(
                          position: i,
                          columnCount: 2,
                          child: FadeInAnimation(
                            child: ProductCardItemWidget(
                              contentColor: MyColors.getRandomColor(i),
                              productId: search[i].id.toString(),
                              productLogo: search[i].productLogo!,
                              productTitle: search[i].productTitle!,
                              productPriceFormat: search[i].productPriceFormat!,
                              onPressedLivePreview: () {},
                              onPressedCart: () {
                                Get.dialog(
                                  Dialog(
                                    child: ComponentsDialogCart(
                                      productLogo: search[i].productLogo!,
                                      productTitle: search[i].productTitle!,
                                      productPrice:
                                          search[i].productPriceFormat!,
                                      productAuthor: search[i].productAuthor!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 26),
            Obx(
              () {
                var isSearching = controller.isSearching.value;
                var isTextFieldEmpty = controller.searchController.value.text;

                if (!isSearching && isTextFieldEmpty.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductPaginationIconButton(
                        icon: Icons.arrow_back_ios,
                        iconColor: controller.currentPage.value == 1
                            ? Colors.grey
                            : Colors.black,
                        tooltip: 'previous',
                        onPressed: () {
                          if (controller.currentPage.value == 1) {
                            return;
                          } else {
                            controller.goToPreviousPage();
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.lastPage.value,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final pageNumber = index + 1;
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.goToPage(pageNumber);
                                },
                                child: Container(
                                  width: 30,
                                  margin: const EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: pageNumber ==
                                            controller.currentPage.value
                                        ? MyColors.primary
                                        : Colors.grey[300],
                                  ),
                                  child: Text(
                                    pageNumber.toString(),
                                    style: MyTextTheme.defaultStyle(
                                      color: pageNumber ==
                                              controller.currentPage.value
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ProductPaginationIconButton(
                        icon: Icons.arrow_forward_ios,
                        iconColor: controller.currentPage.value ==
                                controller.lastPage.value
                            ? Colors.grey
                            : Colors.black,
                        tooltip: 'Next',
                        onPressed: () {
                          if (controller.currentPage.value ==
                              controller.lastPage.value) {
                            return;
                          } else {
                            controller.goToNextPage();
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
