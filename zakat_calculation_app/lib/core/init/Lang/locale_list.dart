import 'package:flutter/material.dart';

class LocaleList {
  static Locale getLocale({required LocaleNames localeName}) {
    if (localeName == LocaleNames.ENGLISH) {
      return const Locale('en', 'US');
    } else if (localeName == LocaleNames.TURKISH) {
      return const Locale('tr', 'TR');
    } else {
      return const Locale('tr', 'TR');
    }
  }
}

enum LocaleNames { ENGLISH, TURKISH }
