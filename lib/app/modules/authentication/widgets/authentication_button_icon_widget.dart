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
      label: Text(label,
          style:
              TextStyle(color: Colors.grey[900], fontStyle: FontStyle.italic)),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(side: BorderSide()),
        backgroundColor: Colors.white,
        minimumSize: minimumSize,
      ),
    );
  }
}
