import 'package:flutter/material.dart';

const colorList = [Colors.orange, Colors.yellow, Colors.black, Colors.white];

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
