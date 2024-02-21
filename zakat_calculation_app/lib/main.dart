import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_list.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/routes/names.dart';
import 'package:zakat_calculation_app/core/routes/pages.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleStrings(),
      locale: LocaleList.getLocale(localeName: LocaleNames.TURKISH),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.routes,
      title: 'Zakat Calculate',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(primary: ProductColors.mainPurple),
      ),
    );
  }
}
