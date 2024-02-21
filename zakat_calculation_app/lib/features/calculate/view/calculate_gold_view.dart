import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:zakat_calculation_app/core/data/model/zakat_history_model.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/view/widget/text/locale_text.dart';
import 'package:zakat_calculation_app/features/calculate/view_model/controller.dart';
import 'package:zakat_calculation_app/product/const/product_border_radius.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';
import 'package:zakat_calculation_app/product/extension/lottie_paths.dart';
import 'package:zakat_calculation_app/product/widgets/divider_close_button.dart';
import 'package:zakat_calculation_app/product/widgets/info_card.dart';

class CalculateGoldView extends GetView<CalculateController> {
  CalculateGoldView({super.key});

  final TextEditingController _userGoldGramController = TextEditingController();
  final TextEditingController _tfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleStringsName.cwgAppBarText.name.tr),
      ),
      body: Padding(
        padding: const ProductPaddings.scaffoldPadding(),
        child: Column(
          children: [
            Padding(
              padding: const ProductPaddings.seperatorPadding(),
              child: InfoCard(
                text:
                    "${LocaleStringsName.cwginfoText.name.tr}${controller.state.goldGram.value} TL",
                widget: _buildChangeGoldGram(
                  context: context,
                  height: height,
                ),
              ),
            ),
            Padding(
              padding: const ProductPaddings.seperatorPadding(),
              child: Obx(() => _buildUserGramToTRY(width, context)),
            ),
            Padding(
              padding: const ProductPaddings.seperator100Padding(),
              child: FilledButton(
                  onPressed: () {
                    _calculateZakat(context);
                    _addToHistory();
                  },
                  child: LocaleText(
                      text: LocaleStringsName.cwgZCButtonText.name.tr)),
            ),
            Obx(() => _buildCalculateResult(width, height, context)),
            Expanded(child: Lottie.asset(LottiePaths.zakatLottie.getPath()))
          ],
        ),
      ),
    );
  }

  Widget _buildCalculateResult(
      double width, double height, BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.1,
      child: Card(
        color: ProductColors.customGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocaleText(
                  text: LocaleStringsName.cwgZResultText.name.tr,
                  style: context.general.textTheme.titleMedium,
                ),
                Text(
                  "${controller.state.userZakatAmount.value} TL",
                  style: context.general.textTheme.titleSmall,
                ),
              ],
            ),
            SizedBox(
                height: height * 0.08,
                child: Image.asset(ImagePNG.zakatIcon1.getImage()))
          ],
        ),
      ),
    );
  }

  Widget _buildUserGramToTRY(double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width * 0.6,
          child: TextField(
            focusNode: controller.gramCalculateFocusNode,
            controller: _userGoldGramController,
            onTapOutside: (event) {
              _calculteUserGramToTRY(context);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: LocaleStringsName.cwgTFText.name.tr,
                border: OutlineInputBorder(
                    borderRadius: ProductBorderRadius.inkWellBorderRadius())),
          ),
        ),
        SizedBox(
            width: width * 0.25,
            child: Text(
              "${controller.state.userGramCalculate.value} TL",
              style: context.general.textTheme.bodyLarge,
            ))
      ],
    );
  }

  Widget _buildChangeGoldGram(
      {required double height, required BuildContext context}) {
    return Obx(() => AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            height: controller.state.keyboardState.value
                ? height * 0.6
                : height * 0.35,
            child: Column(
              children: [
                const DividerCloseButton(),
                Padding(
                  padding: const ProductPaddings.dividerTFPadding(),
                  child: TextField(
                    focusNode: controller.keyboardfocusNode,
                    controller: _tfController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: LocaleStringsName.cwgChangeGGTFText.name.tr,
                        border: OutlineInputBorder(
                            borderRadius:
                                ProductBorderRadius.inkWellBorderRadius())),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton(
                  onPressed: () {
                    String content = "";

                    if (_tfController.text == "" ||
                        double.parse(_tfController.text) == 0.0) {
                      content =
                          LocaleStringsName.cwgChangeGGWarningText.name.tr;
                    } else {
                      content =
                          "${LocaleStringsName.cwgChangeGGResultText.name.tr} : ${double.parse(_tfController.text)}";

                      controller.setGoldGram(
                          newGoldGram: double.parse(_tfController.text));
                    }

                    AlertDialog alertDialog = AlertDialog(
                      title: Text(LocaleStringsName.cwgChangeGGADTitle.name.tr),
                      content: Text(content),
                    );
                    Get.back();
                    showDialog(context: context, builder: (_) => alertDialog);
                  },
                  child: LocaleText(
                      text: LocaleStringsName.cwgChangeGGButtonText.name.tr),
                )
              ],
            ),
          ),
        ));
  }

  void _calculateZakat(BuildContext context) {
    if (_userGoldGramController.text == "" ||
        controller.state.userGramCalculate.value == 0.0) {
      AlertDialog alertDialog = AlertDialog(
        title: Text(LocaleStringsName.appBarText.name.tr),
        content: Text(LocaleStringsName.cwgWPEnterGGText.name.tr),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    } else {
      AlertDialog alertDialog = AlertDialog(
          title: Text(LocaleStringsName.appBarText.name.tr),
          content: Text(LocaleStringsName.cwgZCSuccessText.name.tr));
      showDialog(context: context, builder: (_) => alertDialog);
      controller.calculateUserZakat();
    }
  }

  void _calculteUserGramToTRY(BuildContext context) {
    if (_userGoldGramController.text != "") {
      if (double.parse(_userGoldGramController.text) >= 80.18) {
        controller
            .calculateUserGramToTRY(double.parse(_userGoldGramController.text));
      } else {
        _userGoldGramController.text = "";
        controller.state.userGramCalculate.value = 0.0;
        AlertDialog alertDialog = AlertDialog(
          title: Text(LocaleStringsName.cwgChangeGGADTitle.name.tr),
          content: Text(LocaleStringsName.cwgChangeGGWarning2Text.name.tr),
        );
        showDialog(context: context, builder: (_) => alertDialog);
      }
    }
  }

  void _addToHistory() {
    ZakatHistoryModel zakatModel = ZakatHistoryModel(
        calculateFrom: "GOLD",
        calculateTo: "TL",
        amountOfUser: controller.state.userGramCalculate.value.toString(),
        amountOfZakat: controller.state.userZakatAmount.value.toString(),
        value: controller.state.goldGram.value.toString());

    controller.addToHistory(zakatModel);
  }
}
