import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/my_text_theme.dart';
import '../../responsive/responsive_layout_controller.dart';
import '../controllers/product_controller.dart';

class ProductHeaderWidget extends GetView<ProductController> {
  const ProductHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveController = Get.find<ResponsiveLayoutController>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Obx(
        () {
          final categoryIndex = responsiveController.categoryIndex.value;
          String pageTitle = 'Default Title'; // Set a default title

          if (categoryIndex == 0) {
            pageTitle = 'All Categories';
          } else if (categoryIndex >= 1 &&
              categoryIndex <= controller.category!.length) {
            final selectedCategory = controller.category![categoryIndex - 1];
            pageTitle = selectedCategory.categoryName ?? 'Invalid Category';
          }

          return Text(
            controller.capitalize(pageTitle),
            style: MyTextTheme.defaultStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}
