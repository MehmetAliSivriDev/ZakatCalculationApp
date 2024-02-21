import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/view/widget/text/locale_text.dart';
import 'package:zakat_calculation_app/features/zakat_calculate_history/view_model/controller.dart';
import 'package:zakat_calculation_app/product/const/product_border_radius.dart';
import 'package:zakat_calculation_app/product/const/product_colors.dart';
import 'package:zakat_calculation_app/product/const/product_paddings.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';
import 'package:zakat_calculation_app/product/extension/lottie_paths.dart';

class ZakatCalculateHistoryView
    extends GetView<ZakatCalculateHistoryController> {
  const ZakatCalculateHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleStringsName.hwAppBarText.name.tr),
      ),
      body: Padding(
        padding: const ProductPaddings.scaffoldPadding(),
        child: Obx(() => controller.state.filteredZakats.length == 0
            ? _buildNoHistory(context)
            : Column(
                children: [
                  Padding(
                    padding: const ProductPaddings.seperatorPadding(),
                    child: _buildCategories(context),
                  ),
                  Expanded(
                    child: _buildZakats(),
                  ),
                ],
              )),
      ),
    );
  }

  Widget _buildZakats() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: controller.state.filteredZakats.length,
      itemBuilder: (context, index) {
        return _buildZakatHistoryCard(index, context);
      },
    );
  }

  Widget _buildCategories(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.state.categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (context, index) {
          return _buildCategoryContainer(context, index);
        },
      ),
    );
  }

  Widget _buildCategoryContainer(BuildContext context, int index) {
    return InkWell(
      borderRadius: ProductBorderRadius.inkWellBorderRadius(),
      onTap: () {
        controller.state.categories[index].onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: controller.state.ctgIndex.value == index
              ? ProductColors.secondPurple
              : ProductColors.customGrey,
          borderRadius: ProductBorderRadius.inkWellBorderRadius(),
        ),
        child: Padding(
          padding: const ProductPaddings.scaffoldPadding(),
          child: Row(
            children: [
              Padding(
                padding: const ProductPaddings.rowBracketPadding(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child:
                      Image.asset(controller.state.categories[index].photoUrl),
                ),
              ),
              LocaleText(
                text: controller.state.categories[index].categoryName,
                style: context.general.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZakatHistoryCard(int index, BuildContext context) {
    return Card(
      color: ProductColors.customGrey,
      child: ListTile(
        leading: getImageForLeading(
            controller.state.filteredZakats[index].calculateFrom ?? ""),
        title: _buildZakatHCardContent(context, index),
        trailing: _buildZakatHCardDeleteButton(index, context),
      ),
    );
  }

  Widget _buildZakatHCardDeleteButton(int index, BuildContext context) {
    return InkWell(
      borderRadius: ProductBorderRadius.inkWellBorderRadius(),
      onTap: () async {
        _deleteZakat(index, context);
      },
      child: const Card(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.delete),
        ),
      ),
    );
  }

  Widget _buildZakatHCardContent(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getValueTitleForContent(
              controller.state.filteredZakats[index].calculateFrom ?? ""),
          style: context.general.textTheme.titleMedium,
        ),
        Text(
          "${controller.state.filteredZakats[index].value} TL",
          style: context.general.textTheme.bodyLarge,
        ),
        Text(
          LocaleStringsName.hwAmountUserText.name.tr,
          style: context.general.textTheme.titleMedium,
        ),
        Text(
          "${controller.state.filteredZakats[index].amountOfUser} TL",
          style: context.general.textTheme.bodyLarge,
        ),
        Text(
          LocaleStringsName.hwZakatAmount.name.tr,
          style: context.general.textTheme.titleMedium,
        ),
        Text(
          "${controller.state.filteredZakats[index].amountOfZakat} TL",
          style: context.general.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildNoHistory(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const ProductPaddings.seperator100Padding(),
            child: Lottie.asset(LottiePaths.empty_lottie.getPath()),
          ),
          Text(
            textAlign: TextAlign.center,
            LocaleStringsName.hwNoHistoryText.name.tr,
            style: context.general.textTheme.headlineSmall,
          )
        ],
      ),
    );
  }

  Widget getImageForLeading(String from) {
    if (from == "GOLD") {
      return Image.asset(ImagePNG.goldIcon.getImage());
    } else if (from == "EURO") {
      return Image.asset(ImagePNG.euroIcon.getImage());
    } else if (from == "DOLAR") {
      return Image.asset(ImagePNG.dolarIcon.getImage());
    } else {
      return Image.asset(ImagePNG.history_icon.getImage());
    }
  }

  String getValueTitleForContent(String from) {
    if (from == "GOLD") {
      return LocaleStringsName.hwGoldValueText.name.tr;
    } else if (from == "EURO") {
      return LocaleStringsName.hwEuroValueText.name.tr;
    } else if (from == "DOLAR") {
      return LocaleStringsName.hwDolarValueText.name.tr;
    } else {
      return "";
    }
  }

  void _deleteZakat(int index, BuildContext context) {
    int result = 0;

    AlertDialog deleteAlert = AlertDialog(
      title: Text(LocaleStringsName.hwADaSure.name.tr),
      content: Text(LocaleStringsName.hwADQuestion1.name.tr),
      actions: [
        TextButton(
          onPressed: () async {
            result = await controller
                .deleteZakat(controller.state.filteredZakats[index].id ?? 0);

            Get.back();

            if (result != 0) {
              AlertDialog alertDialog = new AlertDialog(
                title: Text(LocaleStringsName.hwADResultTitle.name.tr),
                content: Text(LocaleStringsName.hwADResult.name.tr),
              );
              showDialog(context: context, builder: (_) => alertDialog);
              controller.getZakats();
            }
          },
          child: Text(LocaleStringsName.yes.name.tr),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(LocaleStringsName.no.name.tr),
        ),
      ],
    );

    showDialog(context: context, builder: (_) => deleteAlert);
  }
}
