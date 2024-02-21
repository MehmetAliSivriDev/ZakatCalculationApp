import 'package:flutter/material.dart';
import 'package:forex_conversion/forex_conversion.dart';
import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/data/dbHelper.dart';
import 'package:zakat_calculation_app/core/data/model/zakat_history_model.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/core/routes/names.dart';
import 'package:zakat_calculation_app/features/calculate/model/zakat_category_model.dart';
import 'package:zakat_calculation_app/features/calculate/view_model/state.dart';
import 'package:zakat_calculation_app/product/extension/image_paths.dart';

class CalculateController extends GetxController {
  final state = CalculateState();
  final fx = Forex();
  late final FocusNode _keyboardfocusNode;
  late final FocusNode _gramCalculateFocusNode;
  DbHelper dbHelper = DbHelper();

  CalculateController() {
    _keyboardfocusNode = FocusNode();
    _keyboardfocusNode.addListener(_onFocusChange);

    _gramCalculateFocusNode = FocusNode();
    _gramCalculateFocusNode.addListener(_onFocusChange2);
  }

  FocusNode get keyboardfocusNode => _keyboardfocusNode;
  FocusNode get gramCalculateFocusNode => _gramCalculateFocusNode;

  void _onFocusChange() {
    if (_keyboardfocusNode.hasFocus) {
      state.keyboardState.value = true;
    } else {
      state.keyboardState.value = false;
    }
  }

  void _onFocusChange2() {
    if (_gramCalculateFocusNode.hasFocus) {
      state.keyboardState.value = true;
    } else {
      state.keyboardState.value = false;
    }
  }

  void getCategories() {
    state.categories = [
      ZakatCategoryModel(
        categoryName: LocaleStringsName.cwGoldText.name.tr,
        photoUrl: ImagePNG.goldIcon.getImage(),
        onTap: () {
          Get.toNamed(AppRoutes.CALCULATE_GOLD);
        },
      ),
      ZakatCategoryModel(
        categoryName: "Dolar",
        photoUrl: ImagePNG.dolarIcon.getImage(),
        onTap: () {
          Get.toNamed(AppRoutes.CALCULATE_DOLAR);
        },
      ),
      ZakatCategoryModel(
        categoryName: "Euro",
        photoUrl: ImagePNG.euroIcon.getImage(),
        onTap: () {
          Get.toNamed(AppRoutes.CALCULATE_EURO);
        },
      )
    ];
  }

  //Gold Transactions
  Future<void> getGoldGramToTRY() async {
    final double xauToTRY = await fx.getCurrencyConverted(
        sourceCurrency: "XAU", destinationCurrency: "TRY", sourceAmount: 1);

    final double goldGram = xauToTRY / 31.1035;
    final double roundedGoldGram = double.parse(goldGram.toStringAsFixed(2));

    state.goldGram.value = roundedGoldGram;
  }

  void setGoldGram({required double newGoldGram}) {
    state.goldGram.value = newGoldGram;
  }

  void calculateUserGramToTRY(double userGram) {
    double userGramToTRY = userGram * state.goldGram.value;

    state.userGramCalculate.value =
        double.parse(userGramToTRY.toStringAsFixed(2));
  }

  void calculateUserZakat() {
    double zakatAmount = (state.userGramCalculate.value * 2.5) / 100;

    state.userZakatAmount.value = zakatAmount;
  }
  //----------------------------------------------------------------------------

  //Dolar Transactions

  Future<void> getDolartoTRY() async {
    final double dolarToTRY = await fx.getCurrencyConverted(
        sourceCurrency: "USD", destinationCurrency: "TRY", sourceAmount: 1);

    state.dolar.value = dolarToTRY;
  }

  double calculateUserDolarToTRY(double userDolar) {
    double userDolarToTRY = userDolar * state.dolar.value;

    if (userDolarToTRY >= getLimit()) {
      state.userDolarCalculate.value =
          double.parse(userDolarToTRY.toStringAsFixed(2));
      return state.userDolarCalculate.value;
    } else {
      return 0;
    }
  }

  void calculateUserDolarZakat() {
    double zakatAmount = (state.userDolarCalculate.value * 2.5) / 100;

    state.userDolarZakatAmount.value = zakatAmount;
  }

  void setDolarValue({required double newDolarValue}) {
    state.dolar.value = newDolarValue;
  }

  //----------------------------------------------------------------------------

  //Euro Transactions

  Future<void> getEurotoTRY() async {
    final double euroToTRY = await fx.getCurrencyConverted(
        sourceCurrency: "EUR", destinationCurrency: "TRY", sourceAmount: 1);

    state.euro.value = euroToTRY;
  }

  double calculateUserEuroToTRY(double userEuro) {
    double userEuroToTRY = userEuro * state.euro.value;

    if (userEuroToTRY >= getLimit()) {
      state.userEuroCalculate.value =
          double.parse(userEuroToTRY.toStringAsFixed(2));
      return state.userEuroCalculate.value;
    } else {
      return 0;
    }
  }

  void calculateUserEuroZakat() {
    double zakatAmount = (state.userEuroCalculate.value * 2.5) / 100;

    state.userEuroZakatAmount.value = zakatAmount;
  }

  void setEuroValue({required double newEuroValue}) {
    state.euro.value = newEuroValue;
  }

  //----------------------------------------------------------------------------

  void addToHistory(ZakatHistoryModel zakatModel) {
    dbHelper.createDb().then((value) => null);

    dbHelper.zakatAdd(zakatModel);
  }

  double getLimit() {
    double zakatLimit = state.goldGram.value * 80.18;
    return double.parse(zakatLimit.toStringAsFixed(2));
  }

  @override
  void onInit() {
    getCategories();
    getGoldGramToTRY();
    getDolartoTRY();
    getEurotoTRY();
    state.userGramCalculate.value = 0.0;
    state.userZakatAmount.value = 0.0;
    super.onInit();
  }

  @override
  void onClose() {
    _keyboardfocusNode.dispose();
    _gramCalculateFocusNode.dispose();
    super.onClose();
  }
}
