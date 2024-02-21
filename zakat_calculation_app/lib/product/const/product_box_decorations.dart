import 'package:flutter/material.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';

class ProductBoxDecorations extends BoxDecoration {
  static final containerListTileDecoration = BoxDecoration(
      border: Border.all(width: 3, color: ProductColors.secondPurple),
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [
        ProductColors.secondPurple,
        ProductColors.mainPurple,
      ]));
}
