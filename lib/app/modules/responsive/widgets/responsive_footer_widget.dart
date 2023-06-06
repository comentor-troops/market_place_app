import 'package:flutter/material.dart';

import '../../../theme/my_text_theme.dart';

class ResponsiveFooterWidget extends StatelessWidget {
  const ResponsiveFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      color: Colors.grey[900],
      child: Row(
        children: [
          Flexible(
            child: Text(
              '© 2023 Marketplace Pty Ltd. Trademarks and brands are the property of their respective owners.',
              style: MyTextTheme.defaultStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
