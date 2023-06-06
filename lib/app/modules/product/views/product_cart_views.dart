import 'package:comentor_marketplace_app/app/modules/responsive/widgets/responsive_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductCartViews extends GetView<ProductController> {
  const ProductCartViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHeaderWidget(context: context, useLeading: true),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
