import 'package:comentor_marketplace_app/app/theme/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../theme/my_text_theme.dart';

class ProductSearchWidget extends StatelessWidget {
  const ProductSearchWidget({
    super.key,
    required this.controller,
    this.onChanged,
    required this.constraints,
  });
  final BoxConstraints constraints;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Search with name of category',
        hintStyle: MyTextTheme.defaultStyle(),
        constraints: constraints,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 60,
          minHeight: 50,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 28.0,
          color: Colors.grey[500],
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: MyColors.primary,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
