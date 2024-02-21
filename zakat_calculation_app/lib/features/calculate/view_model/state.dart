import 'package:get/get.dart';
import 'package:zakat_calculation_app/features/calculate/model/zakat_category_model.dart';

class CalculateState {
  late List<ZakatCategoryModel> categories;
  var warning = "".obs;
  var keyboardState = false.obs;

  //Gold States
  var goldGram = 0.0.obs;
  var userGramCalculate = 0.0.obs;
  var userZakatAmount = 0.0.obs;

  //Dolar States
  var dolar = 0.0.obs;
  var userDolarCalculate = 0.0.obs;
  var userDolarZakatAmount = 0.0.obs;

  //Euro States
  var euro = 0.0.obs;
  var userEuroCalculate = 0.0.obs;
  var userEuroZakatAmount = 0.0.obs;
}
