import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_list.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/routes/names.dart';
import 'package:zakat_calculation_app/core/view/widget/text/locale_text.dart';
import 'package:zakat_calculation_app/product/const/product_box_decorations.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';
import 'package:zakat_calculation_app/product/extension/lottie_paths.dart';
import 'package:zakat_calculation_app/product/mixin/show_bottom_sheet.dart';
import 'package:zakat_calculation_app/product/widgets/divider_close_button.dart';

class HomeView extends StatelessWidget with ShowBottomSheet {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: _customFabButton(context: context),
      appBar: AppBar(
        title: Text(LocaleStringsName.appBarText.name.tr),
        actions: [_buildZakatConditions(context, width, height)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: width,
                child: Image.asset(ImageJPG.zekatFoto2.getImage())),
            Padding(
              padding: const ProductPaddings.scaffoldPadding(),
              child: _customLTBuild(
                  onTap: () {
                    Get.toNamed(AppRoutes.CALCULATE);
                  },
                  context: context,
                  text: LocaleStringsName.hLTZakatText.name.tr,
                  imagePath: ImagePNG.bag_of_gold_icon.getImage()),
            ),
            Padding(
              padding: const ProductPaddings.scaffoldPadding(),
              child: _customLTBuild(
                  onTap: () {
                    Get.toNamed(AppRoutes.CALCULATE_HISTORY);
                  },
                  context: context,
                  text: LocaleStringsName.hLTHistoryText.name.tr,
                  imagePath: ImagePNG.history_icon.getImage()),
            ),
            Padding(
              padding: const ProductPaddings.scaffoldPadding(),
              child: _customLTBuild(
                  onTap: () {
                    Get.toNamed(AppRoutes.CURRENCY_RATE);
                  },
                  context: context,
                  text: LocaleStringsName.hLTCRateText.name.tr,
                  imagePath: ImagePNG.current_rate.getImage()),
            ),
            Padding(
              padding: const ProductPaddings.scaffoldPadding(),
              child: _customLTBuild(
                  onTap: () {
                    Get.toNamed(AppRoutes.CALCULATE_HOW);
                  },
                  context: context,
                  text: LocaleStringsName.hLTCHowText.name.tr,
                  imagePath: ImagePNG.question_mark_calculator.getImage()),
            ),
            Expanded(
              child: Lottie.asset(LottiePaths.home_lottie.getPath()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildZakatConditions(
      BuildContext context, double width, double height) {
    return TextButton(
        onPressed: () {
          showCustomSheet(
              context,
              SizedBox(
                width: width,
                height: height * 0.5,
                child: Padding(
                  padding: const ProductPaddings.scaffoldPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DividerCloseButton(),
                      Padding(
                        padding: const ProductPaddings.seperatorPadding(),
                        child: Text(
                          LocaleStringsName.hzcTitle.name.tr,
                          style: context.general.textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        LocaleStringsName.hzcSubTitle.name.tr,
                        style: context.general.textTheme.titleSmall,
                      ),
                      Text(
                        LocaleStringsName.hzcCondition1.name.tr,
                        style: context.general.textTheme.bodyLarge,
                      ),
                      Text(
                        LocaleStringsName.hzcCondition2.name.tr,
                        style: context.general.textTheme.bodyLarge,
                      ),
                      Text(
                        LocaleStringsName.hzcCondition3.name.tr,
                        style: context.general.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ));
        },
        child: Row(
          children: [
            Text(LocaleStringsName.appBarZCBText.name.tr),
            const Icon(
              Icons.question_mark,
              size: 15,
            )
          ],
        ));
  }

  Widget _customFabButton({required BuildContext context}) {
    return FloatingActionButton.extended(
      onPressed: () {
        AlertDialog languageDialog = AlertDialog(
          title: Text(LocaleStringsName.fabButtonText.name.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Get.updateLocale(
                      LocaleList.getLocale(localeName: LocaleNames.ENGLISH));
                  Get.back();
                },
                title: Text(LocaleNames.ENGLISH.name),
              ),
              ListTile(
                onTap: () {
                  Get.updateLocale(
                      LocaleList.getLocale(localeName: LocaleNames.TURKISH));
                  Get.back();
                },
                title: Text(LocaleNames.TURKISH.name),
              ),
            ],
          ),
        );

        showDialog(context: context, builder: (_) => languageDialog);
      },
      label: Row(
        children: [
          const Padding(
            padding: ProductPaddings.rowBracketPadding(),
            child: Icon(
              Icons.language,
            ),
          ),
          LocaleText(text: LocaleStringsName.fabButtonText.name.tr)
        ],
      ),
    );
  }

  Widget _customLTBuild(
      {required BuildContext context,
      required String text,
      required String imagePath,
      required void Function() onTap}) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
        decoration: ProductBoxDecorations.containerListTileDecoration,
        child: ListTile(
          onTap: () {
            onTap();
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: context.general.textTheme.titleLarge,
              ),
              Opacity(
                opacity: 0.75,
                child: SizedBox(
                    width: width * 0.12,
                    height: height * 0.1,
                    child: Image.asset(
                      imagePath,
                    )),
              )
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ));
  }
}
