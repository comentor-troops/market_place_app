import 'package:flutter/material.dart';

import '../../product/prodcut_page.dart';
import '../../product/views/product_category_views.dart';
import '../widgets/responsive_banner_widget.dart';
import '../widgets/responsive_footer_widget.dart';

class ResponsiveComputerViews extends StatelessWidget {
  const ResponsiveComputerViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ResponsiveBannerWidget(),
        const SizedBox(height: 26),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
            const ProductCategoryViews(),
            const SizedBox(width: 26),
            const ProductPage(),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        const ResponsiveFooterWidget()
      ],
    );
  }
}
