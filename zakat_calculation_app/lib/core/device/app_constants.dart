import 'package:flutter/material.dart';

class AppConstants {
  //Localization
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");

  static const List<Locale> SUPPORTED_LOCALES = [
    AppConstants.TR_LOCALE,
    AppConstants.EN_LOCALE
  ];
}
