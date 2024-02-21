import 'package:forex_conversion/forex_conversion.dart';
import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/init/Lang/locale_strings.dart';
import 'package:zakat_calculation_app/features/currency_rate/view_model/state.dart';

class CurrencyRateController extends GetxController {
  final state = CurrencyRateState();
  final fx = Forex();

  void changeLoading() {
    state.isLoading.value = !state.isLoading.value;
  }

  Future<void> getGoldGramToTRY() async {
    final double xauToTRY = await fx.getCurrencyConverted(
        sourceCurrency: "XAU", destinationCurrency: "TRY", sourceAmount: 1);

    final double goldGram = xauToTRY / 31.1035;
    final double roundedGoldGram = double.parse(goldGram.toStringAsFixed(2));

    state.rateGoldGram.value =
        "1 ${LocaleStringsName.goldGram.name.tr}  :  $roundedGoldGram ${LocaleStringsName.turkLirasiText.name.tr}";
  }

  Future<void> getDolartoTRY() async {
    final double dolarToTRY = await fx.getCurrencyConverted(
        sourceCurrency: "USD", destinationCurrency: "TRY", sourceAmount: 1);

    state.rateDolar.value =
        "1 Dolar  :  $dolarToTRY ${LocaleStringsName.turkLirasiText.name.tr}";
  }

  Future<void> getEurotoTRY() async {
    final double euroToTRY = await fx.getCurrencyConverted(
        sourceCurrency: "EUR", destinationCurrency: "TRY", sourceAmount: 1);

    state.rateEuro.value =
        "1 Euro  :  $euroToTRY ${LocaleStringsName.turkLirasiText.name.tr}";
  }

  Future<void> getCurrencyRates() async {
    changeLoading();
    await getGoldGramToTRY();
    await getDolartoTRY();
    await getEurotoTRY();
    await Future.delayed(const Duration(milliseconds: 300));
    changeLoading();
  }

  @override
  void onInit() {
    super.onInit();
    getCurrencyRates();
  }
}
