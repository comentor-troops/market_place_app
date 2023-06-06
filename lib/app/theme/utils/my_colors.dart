import 'dart:math';

import 'package:flutter/material.dart';

class MyColors {
  static getRandomColor(int index, {double opacity = 0.1}) {
    Random random = Random(index);
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      opacity,
    );
  }
}
