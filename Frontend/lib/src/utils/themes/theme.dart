import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/themes/widget_theme/text_theme.dart';

class CAppTheme {
  CAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
