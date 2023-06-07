import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductPaginationIconButton extends GetView<ProductController> {
  const ProductPaginationIconButton({
    super.key,
    this.onPressed,
    required this.tooltip,
    required this.icon,
    required this.iconColor,
  });
  final Color iconColor;
  final IconData icon;
  final String tooltip;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var currentPage = controller.currentPage.value;
      var lastPage = controller.lastPage.value;
      return IconButton(
        splashColor: currentPage == 1 || currentPage == lastPage
            ? Colors.transparent
            : null,
        tooltip: currentPage == 1 || currentPage == lastPage ? null : tooltip,
        alignment: Alignment.center,
        hoverColor: currentPage == 1 || currentPage == lastPage
            ? Colors.transparent
            : null,
        splashRadius: 18,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
      );
    });
  }
}
