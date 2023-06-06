import 'package:flutter/material.dart';

class ComponentsTextButtonWidget extends StatelessWidget {
  const ComponentsTextButtonWidget({
    super.key,
    this.onPressed,
    required this.child,
    required this.overlayColor,
  });
  final Widget child;
  final Color overlayColor;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(overlayColor),
      ),
      child: child,
    );
  }
}
