import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Obx(
      () => controller.isLoadingCategory.value
          ? const CupertinoActivityIndicator()
          : Container(
              width: isComputer ? 240 : 300,
              height: isComputer ? null : double.infinity,
              color: isComputer ? null : Colors.white,
              padding: isComputer
                  ? null
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...List.generate(
                    controller.category!.length + 1,
                    (i) {
                      if (i == 0) {
                        var category = responsiveController.categoryIndex.value;
                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => responsiveController.changeCategory(0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.only(),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: category == 0
                                  ? Colors.purple.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.widgets_outlined,
                                      size: 24,
                                      color: category == 0
                                          ? Colors.purple
                                          : Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "All Category",
                                      style: MyTextTheme.defaultStyle(
                                        fontWeight: FontWeight.w600,
                                        color: category == 0
                                            ? Colors.purple
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
                                          color: Colors.purple,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          controller.product!.length.toString(),
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
                        var category = responsiveController.categoryIndex.value;
                        return InkWell(
                          onTap: () => responsiveController.changeCategory(i),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: category == i
                                  ? Colors.purple.withOpacity(0.3)
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      icon[i - 1],
                                      size: 24,
                                      color: category == i
                                          ? Colors.purple
                                          : Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      controller.capitalize(controller
                                          .category![i - 1].categoryName!),
                                      style: MyTextTheme.defaultStyle(
                                        fontWeight: FontWeight.w600,
                                        color: category == i
                                            ? Colors.purple
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
                                          color: Colors.purple,
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
