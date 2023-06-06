import 'package:comentor_marketplace_app/app/modules/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class ResponsiveBannerWidget extends StatelessWidget {
  const ResponsiveBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    return Container(
      width: double.infinity,
      height: isPhone ? 200 : 300,
      color: Colors.grey[200],
    );
  }
}
