import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(context) {
  return ThemeData.light().copyWith(
      primaryColor: kLPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: kDPrimaryColor),
        overline: TextStyle(color: kDPrimaryColor),
        bodyText2: TextStyle(color: kDPrimaryColor),
        caption: TextStyle(color: kDPrimaryColor),
      ),
      iconTheme: const IconThemeData(color: kDPrimaryColor),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: kDPrimaryColor),
      scaffoldBackgroundColor: kLPrimaryColor,
      colorScheme: const ColorScheme.light()
          .copyWith(secondary: kLPinnedColor, primary: kDPrimaryColor));
}

ThemeData darkTheme(context) {
  return ThemeData.dark().copyWith(
      primaryColor: kDPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kDPrimaryColor,
      iconTheme: const IconThemeData(color: kLPrimaryColor),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: kLPrimaryColor),
        overline: TextStyle(color: kLPrimaryColor),
        bodyText2: TextStyle(color: kLPrimaryColor),
        caption: TextStyle(color: kLPrimaryColor),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: kLPrimaryColor),
      colorScheme: const ColorScheme.dark()
          .copyWith(secondary: kDPinnedColor, primary: kLPinnedColor));
}
