import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/view/widget/text/locale_text.dart';
import 'package:zakat_calculation_app/features/calculate_how/view_model/controller.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/extension/lottie_paths.dart';

class CalculateHowView extends GetView<CalculateHowController> {
  const CalculateHowView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const ProductPaddings.scaffoldPadding(),
        child: _buildPages(width, height),
      ),
    );
  }

  Widget _buildPages(double width, double height) {
    return PageView.builder(
      itemCount: controller.state.categories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return _buildPage(width, height, index, context);
      },
    );
  }

  Widget _buildPage(
      double width, double height, int index, BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          _buildILRow(width, height, index),
          _buildTitle(index, context),
          _buildDetailHeader(context),
          _buildDetail(index, context),
          _buildExplanationHeader(context),
          _buildExplanation(index, context),
        ],
      ),
    );
  }

  Widget _buildExplanation(int index, BuildContext context) {
    return Expanded(
      flex: 5,
      child: Card(
        color: ProductColors.customGrey,
        child: Padding(
          padding: const ProductPaddings.scaffoldPadding(),
          child: LocaleText(
            align: TextAlign.center,
            text: controller.state.categories[index].calculateInfo ?? "",
            style: context.general.textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }

  Widget _buildExplanationHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LocaleText(
          text: LocaleStringsName.chvExplanationHeader.name.tr,
          style: context.general.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildDetail(int index, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const ProductPaddings.seperatorPadding(),
        child: Card(
          color: ProductColors.customGrey,
          child: Padding(
            padding: const ProductPaddings.scaffoldPadding(),
            child: LocaleText(
              align: TextAlign.center,
              text: controller.state.categories[index].categoryDetail ?? "",
              style: context.general.textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LocaleText(
          text: LocaleStringsName.chvDetailHeader.name.tr,
          style: context.general.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildTitle(int index, BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const ProductPaddings.seperatorPadding(),
        child: Padding(
          padding: const ProductPaddings.scaffoldPadding(),
          child: LocaleText(
            text: controller.state.categories[index].categoryName ?? "",
            style: context.general.textTheme.displayMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildILRow(double width, double height, int index) {
    return SizedBox(
      width: width,
      height: height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.4,
            child:
                Image.asset(controller.state.categories[index].photoUrl ?? ""),
          ),
          SizedBox(
              width: width * 0.5,
              child: Lottie.asset(LottiePaths.zakatLottie.getPath()))
        ],
      ),
    );
  }
}
