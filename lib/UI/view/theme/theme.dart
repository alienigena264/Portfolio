import 'package:flutter/material.dart';
import 'package:portafolio/UI/view/theme/colors.dart';


class AppTheme {
  final int colorSelected;

  AppTheme({
    this.colorSelected = 0
    }): assert(colorSelected >= 0, 'Selected color must be greater be 0'),
    assert(colorSelected < colorList.length -1, 'Selected color must be less ${ colorList.length }');

  ThemeData getTheme()  => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[colorSelected],

  );
}
