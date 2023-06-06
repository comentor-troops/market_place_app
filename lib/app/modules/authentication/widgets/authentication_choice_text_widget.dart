import 'package:flutter/material.dart';

import '../../../components/components_textbutton_widget.dart';
import '../../../theme/my_text_theme.dart';

class AuthenticationChoiceTextWidget extends StatelessWidget {
  const AuthenticationChoiceTextWidget({
    super.key,
    required this.label,
    required this.textButton,
    required this.mainAxisAlignment,
    this.onPressed,
  });
  final String label;
  final String textButton;
  final MainAxisAlignment mainAxisAlignment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          label,
          style: MyTextTheme.defaultStyle(),
        ),
        ComponentsTextButtonWidget(
          onPressed: onPressed,
          overlayColor: Colors.transparent,
          child: Text(
            textButton,
            style: MyTextTheme.defaultStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
