import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';

class CTextFormFieldTheme {
  CTextFormFieldTheme._();
  static InputDecorationTheme ligthInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: cSecondaryColor,
    floatingLabelStyle: TextStyle(color: cSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: cSecondaryColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: cPrimaryColor,
    floatingLabelStyle: TextStyle(color: cPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: cPrimaryColor),
    ),
  );
}
