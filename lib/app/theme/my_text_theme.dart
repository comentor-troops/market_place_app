import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static defaultStyle(
      {double fontSize = 14.0,
      FontWeight fontWeight = FontWeight.w400,
      color = Colors.black,
      FontStyle fontStyle = FontStyle.normal}) {
    return GoogleFonts.urbanist(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      textStyle: const TextStyle(
        overflow: TextOverflow.clip,
      ),
    );
  }
}
