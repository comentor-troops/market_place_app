import 'package:flutter/material.dart';

import '../../product/prodcut_page.dart';
import '../widgets/responsive_banner_widget.dart';
import '../widgets/responsive_footer_widget.dart';

class ResponsiveTabletViews extends StatelessWidget {
  const ResponsiveTabletViews({
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
            const SizedBox(width: 32),
            Flexible(flex: 2, child: Container()),
            const ProductPage(),
            Flexible(flex: 2, child: Container()),
            const SizedBox(width: 32),
          ],
        ),
        const SizedBox(height: 26),
        const ResponsiveFooterWidget(),
      ],
    );
  }
}
