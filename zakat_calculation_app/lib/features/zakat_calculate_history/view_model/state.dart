import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/data/model/zakat_history_model.dart';
import 'package:zakat_calculation_app/features/calculate/model/zakat_category_model.dart';

class ZakatCalculateHistoryState {
  var zakats = <ZakatHistoryModel>[].obs;
  var filteredZakats = <ZakatHistoryModel>[].obs;
  var zakatCounts = 0.obs;

  late List<ZakatCategoryModel> categories;

  var ctgIndex = 0.obs;
}
