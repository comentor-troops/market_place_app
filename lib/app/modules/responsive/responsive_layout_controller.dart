import 'package:comentor_marketplace_app/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveLayoutController extends GetxController {
  ProductController productController = Get.find<ProductController>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var isHovered = List<bool>.generate(5, (_) => false).obs;

  var icon = [
    Icons.shopping_cart,
    Icons.forum_outlined,
    Icons.sell_outlined,
    Icons.source_outlined,
    Icons.login_outlined,
  ];
  var name = [
    'Cart',
    'Forums',
    'Start Selling',
    'Our Products',
    'Sign in',
  ];
  void toggleDrawer() {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.closeDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }

  var isFocused = false.obs;
  final focusNode = FocusNode();

  void toggleFocus() {
    isFocused.value = !isFocused.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      toggleFocus();
    });
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }

  var categoryIndex = 0.obs;
  var isLoading = false.obs;

  void changeCategory(int index) async {
    isLoading.value = true; // Tampilkan Circular Progress Indicator
    if (index == 0) {
      if (productController.products!.isNotEmpty) {
        productController.products!.clear();
        productController.currentPage.value == 0;
      }
      await productController.getProduct();
      update();
    }

    // Delay untuk simulasi proses asinkron (misalnya, pengambilan data)
    Future.delayed(const Duration(milliseconds: 200), () {
      // Lakukan perpindahan halaman sesuai dengan indeks yang dipilih
      categoryIndex.value = index;
      isLoading.value = false;
    });
  }
}
