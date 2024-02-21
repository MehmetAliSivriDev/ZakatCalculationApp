import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/view/widget/text/locale_text.dart';
import 'package:zakat_calculation_app/features/currency_rate/view_model/controller.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/extension/lottie_paths.dart';

class CurrencyRateView extends GetView<CurrencyRateController> {
  const CurrencyRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: LocaleText(text: LocaleStringsName.crwAppBarText.name.tr)),
        body: Obx(
          () => controller.state.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const ProductPaddings.scaffoldPadding(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const ProductPaddings.seperatorPadding(),
                        child: _buildRateCard(
                            context: context,
                            text: controller.state.rateGoldGram.value),
                      ),
                      Padding(
                        padding: const ProductPaddings.seperatorPadding(),
                        child: _buildRateCard(
                            context: context,
                            text: controller.state.rateDolar.value),
                      ),
                      Padding(
                        padding: const ProductPaddings.seperatorPadding(),
                        child: _buildRateCard(
                            context: context,
                            text: controller.state.rateEuro.value),
                      ),
                      Expanded(
                          child: Lottie.asset(
                              LottiePaths.currency_rate_lottie.getPath()))
                    ],
                  ),
                ),
        ));
  }

  Widget _buildRateCard({required BuildContext context, required String text}) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.15,
      child: Card(
        color: ProductColors.secondPurple,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocaleText(
              text: text,
              style: context.general.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
