import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/data/dbHelper.dart';
import 'package:zakat_calculation_app/core/data/model/zakat_history_model.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/features/calculate/model/zakat_category_model.dart';
import 'package:zakat_calculation_app/features/zakat_calculate_history/view_model/state.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';

class ZakatCalculateHistoryController extends GetxController {
  final state = ZakatCalculateHistoryState();
  DbHelper dbHelper = DbHelper();

  void getCategories() {
    state.categories = [
      ZakatCategoryModel(
        categoryName: LocaleStringsName.all.name.tr,
        photoUrl: ImagePNG.cash_stack.getImage(),
        onTap: () {
          getZakatsAll();
          state.ctgIndex.value = 0;
        },
      ),
      ZakatCategoryModel(
        categoryName: LocaleStringsName.cwGoldText.name.tr,
        photoUrl: ImagePNG.goldIcon.getImage(),
        onTap: () {
          getZakatsOnlyGold();
          state.ctgIndex.value = 1;
        },
      ),
      ZakatCategoryModel(
        categoryName: "Dolar",
        photoUrl: ImagePNG.dolarIcon.getImage(),
        onTap: () {
          getZakatsOnlyDolar();
          state.ctgIndex.value = 2;
        },
      ),
      ZakatCategoryModel(
        categoryName: "Euro",
        photoUrl: ImagePNG.euroIcon.getImage(),
        onTap: () {
          getZakatsOnlyEuro();
          state.ctgIndex.value = 3;
        },
      )
    ];
  }

  void getZakats() {
    dbHelper.createDb().then((value) => null);

    var dbFuture = dbHelper.createDb();
    dbFuture.then((result) {
      var zakatsFuture = dbHelper.getZakats();
      zakatsFuture.then((data) {
        List<ZakatHistoryModel> zakatsData = <ZakatHistoryModel>[];
        var zakatsDataCount = data.length;
        for (int i = 0; i < zakatsDataCount; i++) {
          zakatsData.add(ZakatHistoryModel.fromJson(data[i]));
        }
        state.zakats.value = zakatsData;
        state.zakatCounts.value = zakatsDataCount;
        state.filteredZakats.value = state.zakats;
      });
    });
  }

  void getZakatsAll() {
    state.filteredZakats.value = state.zakats;
  }

  void getZakatsOnlyGold() {
    var emptyList = <ZakatHistoryModel>[];
    for (ZakatHistoryModel zakat in state.zakats) {
      if (zakat.calculateFrom == "GOLD") {
        emptyList.add(zakat);
      }
    }

    state.filteredZakats.value = emptyList;
  }

  void getZakatsOnlyDolar() {
    var emptyList = <ZakatHistoryModel>[];
    for (ZakatHistoryModel zakat in state.zakats) {
      if (zakat.calculateFrom == "DOLAR") {
        emptyList.add(zakat);
      }
    }

    state.filteredZakats.value = emptyList;
  }

  void getZakatsOnlyEuro() {
    var emptyList = <ZakatHistoryModel>[];
    for (ZakatHistoryModel zakat in state.zakats) {
      if (zakat.calculateFrom == "EURO") {
        emptyList.add(zakat);
      }
    }

    state.filteredZakats.value = emptyList;
  }

  Future<int> deleteZakat(int id) async {
    dbHelper.createDb().then((value) => null);
    return await dbHelper.zakatDelete(id);
  }

  @override
  void onInit() {
    getZakats();
    getCategories();
    super.onInit();
  }
}
