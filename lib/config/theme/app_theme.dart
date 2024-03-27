import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.amberAccent,
  Colors.redAccent,
  Colors.tealAccent,
  Colors.cyanAccent,
  Colors.pinkAccent,
  Colors.indigoAccent
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0,
          'Seleccionar un color mayor a 0',
        ),
        assert(
          selectedColor < colorList.length,
          'Seleccionar un color menor o igual a ${colorList.length - 1}',
        );

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectedColor]);
}
