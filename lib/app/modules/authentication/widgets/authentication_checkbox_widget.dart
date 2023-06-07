import 'package:comentor_marketplace_app/app/theme/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../theme/my_text_theme.dart';

class AuthenticationCheckboxWidget extends StatelessWidget {
  const AuthenticationCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            splashRadius: 10,
            activeColor: MyColors.primary,
            checkColor: Colors.white,
            value: value,
            onChanged: onChanged),
        const SizedBox(width: 8),
        Text(
          'Remember me',
          style: MyTextTheme.defaultStyle(),
        ),
      ],
    );
  }
}
