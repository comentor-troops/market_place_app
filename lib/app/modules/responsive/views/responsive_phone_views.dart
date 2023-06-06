import 'package:flutter/material.dart';

import '../../product/prodcut_page.dart';
import '../../product/views/product_category_views.dart';
import '../widgets/responsive_banner_widget.dart';
import '../widgets/responsive_footer_widget.dart';

class ResponsivePhoneViews extends StatelessWidget {
  const ResponsivePhoneViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ResponsiveBannerWidget(),
        SizedBox(height: 24),
        ProductCategoryViews(),
        SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 24),
            ProductPage(),
            SizedBox(width: 24),
          ],
        ),
        SizedBox(height: 24),
        ResponsiveFooterWidget(),
      ],
    );
  }
}
