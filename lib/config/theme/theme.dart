import 'package:flutter/material.dart';

const colorList = [
  Color(0xFFDB6B21),
  Color(0xFFFFD700),
  Colors.black,
  Colors.white,
  Color(0xFF24252A)
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, "select color must be  greater then 0"),
        assert(selectedColor < colorList.length,
            "select color must be less or equal than ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
      );
}
