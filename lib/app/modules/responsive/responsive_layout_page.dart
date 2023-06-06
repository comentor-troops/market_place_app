import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/authentication_page.dart';
import '../product/controllers/product_controller.dart';
import '../product/views/product_category_views.dart';
import 'views/responsive_computer_views.dart';
import 'views/responsive_largertablet_views.dart';
import 'views/responsive_phone_views.dart';
import 'views/responsive_tablet_views.dart';
import 'widgets/responsive_header_widget.dart';
import 'responsive_layout.dart';
import 'responsive_layout_controller.dart';

class ResponsiveLayoutPage extends GetView<ResponsiveLayoutController> {
  const ResponsiveLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.find<ProductController>();
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.grey[50],
      appBar: const ResponsiveHeaderWidget(),
      endDrawer: const AuthenticationPage(),
      drawer: const ProductCategoryViews(),
      body: Obx(
        () => product.isLoadingCategory.value || product.isLoadingProduct.value
            ? const Center(child: CupertinoActivityIndicator())
            : const SingleChildScrollView(
                child: ResponsiveLayout(
                  phone: ResponsivePhoneViews(),
                  tablet: ResponsiveTabletViews(),
                  largeTablet: ResponsiveLargeTabletViews(),
                  computer: ResponsiveComputerViews(),
                ),
              ),
      ),
    );
  }
}
