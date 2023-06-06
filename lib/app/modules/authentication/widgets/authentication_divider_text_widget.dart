import 'package:flutter/material.dart';

import '../../../theme/my_text_theme.dart';

class AuthenticationDividerTextWidget extends StatelessWidget {
  const AuthenticationDividerTextWidget({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Divider(
            color: Colors.grey[500],
            indent: 32,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label,
            style: MyTextTheme.defaultStyle(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Divider(
            color: Colors.grey[500],
            endIndent: 32,
          ),
        ),
      ],
    );
  }
}
