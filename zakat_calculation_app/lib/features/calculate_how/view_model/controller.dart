import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/features/calculate_how/model/category_how_model.dart';
import 'package:zakat_calculation_app/features/calculate_how/view_model/state.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';

class CalculateHowController extends GetxController {
  final state = CalculateHowState();

  void getCategories() {
    state.categories = [
      CategoryHowModel(
          categoryName: LocaleStringsName.chvCGoldTitle.name.tr,
          from: "GOLD",
          to: "TL",
          photoUrl: ImagePNG.goldIcon.getImage(),
          categoryDetail: LocaleStringsName.chvCGoldDetail.name.tr,
          calculateInfo: LocaleStringsName.chvCGoldInfo.name.tr),
      CategoryHowModel(
          categoryName: LocaleStringsName.chvCDolarTitle.name.tr,
          from: "DOLAR",
          to: "TL",
          photoUrl: ImagePNG.dolarIcon.getImage(),
          categoryDetail: LocaleStringsName.chvCDolarDetail.name.tr,
          calculateInfo: LocaleStringsName.chvCDolarInfo.name.tr),
      CategoryHowModel(
          categoryName: LocaleStringsName.chvCEuroTitle.name.tr,
          from: "EURO",
          to: "TL",
          photoUrl: ImagePNG.euroIcon.getImage(),
          categoryDetail: LocaleStringsName.chvCEuroDetail.name.tr,
          calculateInfo: LocaleStringsName.chvCEuroInfo.name.tr),
    ];
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
