import 'package:flutter/material.dart';

class ProductPaddings extends EdgeInsets {
  const ProductPaddings.scaffoldPadding() : super.all(10);
  const ProductPaddings.dividerTFPadding() : super.all(20);
  const ProductPaddings.rowBracketPadding() : super.only(right: 5);
  const ProductPaddings.seperatorPadding() : super.only(bottom: 10);
  const ProductPaddings.seperator100Padding() : super.only(bottom: 100);
  const ProductPaddings.infoCardPadding() : super.only(left: 10, right: 10);
}
