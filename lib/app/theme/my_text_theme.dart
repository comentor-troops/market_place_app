import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static defaultStyle(
      {fontSize = 14.0, fontWeight = FontWeight.w400, color = Colors.black}) {
    return GoogleFonts.urbanist(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textStyle: const TextStyle(
        overflow: TextOverflow.clip,
      ),
    );
  }
}
