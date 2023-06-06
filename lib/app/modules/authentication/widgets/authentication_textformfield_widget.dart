import 'package:flutter/material.dart';

import '../../../theme/my_text_theme.dart';

class AuthenticationTextFormFieldWidget extends StatelessWidget {
  const AuthenticationTextFormFieldWidget({
    super.key,
    this.label = '',
    this.hintText = '',
    this.labelStyle,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.onChanged,
  });
  final bool obscureText;
  final String label;
  final String? hintText;
  final TextStyle? labelStyle;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 8),
        TextFormField(
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          cursorColor: Colors.grey[900],
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextTheme.defaultStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[900]!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
