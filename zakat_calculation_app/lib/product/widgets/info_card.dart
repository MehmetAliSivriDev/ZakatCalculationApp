import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:zakat_calculation_app/product/const/product_border_radius.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/mixin/show_bottom_sheet.dart';

class InfoCard extends StatelessWidget with ShowBottomSheet {
  const InfoCard({
    super.key,
    required this.text,
    required this.widget,
  });

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        color: ProductColors.customGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: ProductPaddings.infoCardPadding(),
              child: Icon(Icons.info),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: context.general.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: ProductBorderRadius.inkWellBorderRadius(),
              onTap: () {
                showCustomSheet(context, widget);
              },
              child: const Card(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.change_circle),
              )),
            )
          ],
        ),
      ),
    );
  }
}
