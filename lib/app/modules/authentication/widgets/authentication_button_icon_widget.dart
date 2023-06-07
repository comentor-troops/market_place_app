import 'package:comentor_marketplace_app/app/theme/my_text_theme.dart';
import 'package:flutter/material.dart';

class AuthenticationButtonIconWidget extends StatelessWidget {
  const AuthenticationButtonIconWidget({
    super.key,
    required this.icon,
    required this.label,
    this.minimumSize,
  });
  final Widget icon;
  final String label;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: icon,
      label: Text(
        label,
        style: MyTextTheme.defaultStyle(
          color: Colors.grey[900],
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.5),
            borderRadius: BorderRadius.circular(4)),
        backgroundColor: Colors.white,
        minimumSize: minimumSize,
      ),
    );
  }
}
