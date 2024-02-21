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

class CalculateEuroView extends GetView<CalculateController> {
  CalculateEuroView({super.key});

  final TextEditingController _userEuroController = TextEditingController();
  final TextEditingController _tfGoldController = TextEditingController();
  final TextEditingController _tfEuroController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleStringsName.cweAppBarText.name.tr),
      ),
      body: Padding(
        padding: const ProductPaddings.scaffoldPadding(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                child: InfoCard(
                  text:
                      "${LocaleStringsName.cweinfoText.name.tr}${controller.state.euro.value} TL",
                  widget: _buildChangeEuroValue(
                    context: context,
                    height: height,
                  ),
                ),
              ),
              Padding(
                padding: const ProductPaddings.seperatorPadding(),
                child: _buildLimitInfo(context),
              ),
              Padding(
                padding: const ProductPaddings.seperatorPadding(),
                child: _buildUserEurotoTRY(width, context),
              ),
              Padding(
                padding: const ProductPaddings.seperatorPadding(),
                child: FilledButton(
                    onPressed: () {
                      _calculateZakat(context);
                      _addToHistory();
                    },
                    child: LocaleText(
                        text: LocaleStringsName.cwgZCButtonText.name.tr)),
              ),
              Obx(() => _buildCalculateResult(width, height, context)),
              SizedBox(
                  height: height * 0.3,
                  child: Lottie.asset(LottiePaths.zakatLottie.getPath()))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLimitInfo(BuildContext context) {
    return Obx(() => Card(
          color: ProductColors.customGrey,
          child: Padding(
            padding: const ProductPaddings.scaffoldPadding(),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "${LocaleStringsName.cwdLimitAmount.name.tr} ${controller.getLimit()} TL",
                  style: context.general.textTheme.labelLarge,
                ),
                Text(
                  textAlign: TextAlign.center,
                  LocaleStringsName.cwdLimitNote.name.tr,
                  style: context.general.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildCalculateResult(
      double width, double height, BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 50),
      child: SizedBox(
        width: width,
        height: controller.state.keyboardState.value ? 0 : height * 0.1,
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
                    "${controller.state.userEuroZakatAmount.value} TL",
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
      ),
    );
  }

  Widget _buildUserEurotoTRY(double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width * 0.6,
          child: TextField(
            focusNode: controller.gramCalculateFocusNode,
            controller: _userEuroController,
            onTapOutside: (event) {
              _calculteEuroToTRY(context);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: LocaleStringsName.cweGetEuroAmount.name.tr,
                border: OutlineInputBorder(
                    borderRadius: ProductBorderRadius.inkWellBorderRadius())),
          ),
        ),
        SizedBox(
            width: width * 0.25,
            child: Text(
              "${controller.state.userEuroCalculate.value} TL",
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
                    controller: _tfGoldController,
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

                    if (_tfGoldController.text == "" ||
                        double.parse(_tfGoldController.text) == 0.0) {
                      content =
                          LocaleStringsName.cwgChangeGGWarningText.name.tr;
                    } else {
                      content =
                          "${LocaleStringsName.cwgChangeGGResultText.name.tr} : ${double.parse(_tfGoldController.text)}";

                      controller.setGoldGram(
                          newGoldGram: double.parse(_tfGoldController.text));
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

  Widget _buildChangeEuroValue(
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
                    controller: _tfEuroController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: LocaleStringsName.cweEnterEuroValue.name.tr,
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

                    if (_tfEuroController.text == "" ||
                        double.parse(_tfEuroController.text) == 0.0) {
                      content =
                          LocaleStringsName.cwgChangeGGWarningText.name.tr;
                    } else {
                      content =
                          "${LocaleStringsName.cweNewEuroValue.name.tr} ${double.parse(_tfEuroController.text)}";

                      controller.setEuroValue(
                          newEuroValue: double.parse(_tfEuroController.text));
                    }

                    AlertDialog alertDialog = AlertDialog(
                      title: Text(LocaleStringsName.cweADTitle.name.tr),
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
    if (_userEuroController.text == "" ||
        controller.state.userEuroCalculate.value == 0.0) {
      AlertDialog alertDialog = AlertDialog(
        title: Text(LocaleStringsName.cweAppBarText.name.tr),
        content: Text(LocaleStringsName.cwePleaseEDValue.name.tr),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    } else {
      AlertDialog alertDialog = AlertDialog(
          title: Text(LocaleStringsName.cweAppBarText.name.tr),
          content: Text(LocaleStringsName.cwgZCSuccessText.name.tr));
      showDialog(context: context, builder: (_) => alertDialog);
      controller.calculateUserEuroZakat();
    }
  }

  void _calculteEuroToTRY(BuildContext context) {
    if (_userEuroController.text != "") {
      if (controller
              .calculateUserEuroToTRY(double.parse(_userEuroController.text)) ==
          0) {
        _userEuroController.text = "";
        AlertDialog alertDialog = AlertDialog(
          title: Text(LocaleStringsName.cweEuroAmount.name.tr),
          content: Text(LocaleStringsName.cwdLimitWarning.name.tr),
        );
        showDialog(context: context, builder: (_) => alertDialog);
      }
    }
  }

  void _addToHistory() {
    ZakatHistoryModel zakatModel = ZakatHistoryModel(
        calculateFrom: "EURO",
        calculateTo: "TL",
        amountOfUser: controller.state.userEuroCalculate.value.toString(),
        amountOfZakat: controller.state.userEuroZakatAmount.value.toString(),
        value: controller.state.euro.value.toString());

    controller.addToHistory(zakatModel);
  }
}
