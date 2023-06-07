import 'package:comentor_marketplace_app/app/theme/utils/my_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/my_text_theme.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/responsive_layout_controller.dart';
import '../controllers/product_controller.dart';

class ProductCategoryViews extends GetView<ProductController> {
  const ProductCategoryViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var icon = [
      Icons.web_outlined,
      Icons.shopping_cart_outlined,
      Icons.wysiwyg_outlined,
      Icons.phone_android_outlined,
      Icons.account_box_outlined,
    ];
    final responsiveController = Get.find<ResponsiveLayoutController>();
    var isComputer = ResponsiveLayout.isComputer(context);
    var isPhone = ResponsiveLayout.isPhone(context);
    return Obx(
      () => controller.isLoadingCategory.value
          ? const CupertinoActivityIndicator()
          : isPhone
              ? SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.category!.length + 1,
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    itemBuilder: (context, index) {
                      return Obx(
                        () {
                          var tabCategory =
                              responsiveController.categoryIndex.value;
                          return Stack(
                            children: [
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        responsiveController.changeCategory(0);
                                      } else {
                                        responsiveController
                                            .changeCategory(index);
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabCategory == index
                                            ? MyColors.primary.withOpacity(0.3)
                                            : Colors.grey[50],
                                        borderRadius: BorderRadius.circular(8),
                                        border: tabCategory == index
                                            ? null
                                            : Border.all(width: 0.3),
                                      ),
                                      child: (index == 0)
                                          ? Text(
                                              'All Category',
                                              style: MyTextTheme.defaultStyle(
                                                fontWeight: FontWeight.w600,
                                                color: tabCategory == index
                                                    ? MyColors.primary
                                                    : null,
                                              ),
                                            )
                                          : Text(
                                              controller.capitalize(controller
                                                  .category![index - 1]
                                                  .categoryName!),
                                              style: MyTextTheme.defaultStyle(
                                                fontWeight: FontWeight.w600,
                                                color: tabCategory == index
                                                    ? MyColors.primary
                                                    : null,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              tabCategory == index
                                  ? Positioned(
                                      right: 2,
                                      top: 2,
                                      child: CircleAvatar(
                                        backgroundColor: MyColors.primary,
                                        radius: 10,
                                        child: Text(
                                          (index == 0) ? '1' : '0',
                                          style: MyTextTheme.defaultStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              : Container(
                  width: isComputer ? 240 : 300,
                  height: isComputer ? null : double.infinity,
                  color: isComputer ? null : Colors.white,
                  padding: isComputer
                      ? null
                      : const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ...List.generate(
                        controller.category!.length + 1,
                        (i) {
                          if (i == 0) {
                            var category =
                                responsiveController.categoryIndex.value;
                            return InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () =>
                                  responsiveController.changeCategory(0),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                margin: const EdgeInsets.only(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: category == 0
                                      ? MyColors.primary.withOpacity(0.3)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.widgets_outlined,
                                          size: 24,
                                          color: category == 0
                                              ? MyColors.primary
                                              : Colors.grey,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "All Category",
                                          style: MyTextTheme.defaultStyle(
                                            fontWeight: FontWeight.w600,
                                            color: category == 0
                                                ? MyColors.primary
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                    category == 0
                                        ? Container(
                                            height: 24,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: MyColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              '${controller.paginate!.perPage}',
                                              style: MyTextTheme.defaultStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ),
                              ),
                            );
                          } else {
                            // Elemen kategori berikutnya
                            var category =
                                responsiveController.categoryIndex.value;
                            return InkWell(
                              onTap: () =>
                                  responsiveController.changeCategory(i),
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: category == i
                                      ? MyColors.primary.withOpacity(0.3)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          icon[i - 1],
                                          size: 24,
                                          color: category == i
                                              ? MyColors.primary
                                              : Colors.grey,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          controller.capitalize(controller
                                              .category![i - 1].categoryName!),
                                          style: MyTextTheme.defaultStyle(
                                            fontWeight: FontWeight.w600,
                                            color: category == i
                                                ? MyColors.primary
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                    category == i
                                        ? Container(
                                            height: 26,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: MyColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              '0',
                                              style: MyTextTheme.defaultStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 24)
                    ],
                  ),
                ),
    );
  }
}
