import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../responsive/responsive_layout_controller.dart';
import 'controllers/product_controller.dart';
import 'views/product_all_category_views.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveController = Get.find<ResponsiveLayoutController>();
    return Expanded(
      flex: 10,
      child: Obx(
        () {
          final categoryIndex = responsiveController.categoryIndex.value;
          if (categoryIndex == 0) {
            return const AllCategoryViews();
          } else if (categoryIndex >= 1 &&
              categoryIndex <= controller.category!.length) {
            switch (categoryIndex) {
              case 1:
                return Container();
              case 2:
                return Container();
              case 3:
                return Container();
              case 4:
                return Container();
              default:
                return Container();
            }
          } else {
            return const Center(child: Text("Invalid category"));
          }
        },
      ),
    );
  }
}
