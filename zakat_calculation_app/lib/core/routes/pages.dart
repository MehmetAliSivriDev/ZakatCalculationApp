import 'package:get/get.dart';
import 'package:zakat_calculation_app/core/routes/names.dart';
import 'package:zakat_calculation_app/features/calculate/view/calculate_dolar_view.dart';
import 'package:zakat_calculation_app/features/calculate/view/calculate_euro_view.dart';
import 'package:zakat_calculation_app/features/calculate/view/calculate_gold_view.dart';
import 'package:zakat_calculation_app/features/calculate/view/calculate_view.dart';
import 'package:zakat_calculation_app/features/calculate/view_model/binding.dart';
import 'package:zakat_calculation_app/features/calculate_how/view/calculate_how_view.dart';
import 'package:zakat_calculation_app/features/calculate_how/view_model/binding.dart';
import 'package:zakat_calculation_app/features/currency_rate/view/currency_rate_view.dart';
import 'package:zakat_calculation_app/features/currency_rate/view_model/binding.dart';
import 'package:zakat_calculation_app/features/home/view/home_view.dart';
import 'package:zakat_calculation_app/features/home/view_model/binding.dart';
import 'package:zakat_calculation_app/features/zakat_calculate_history/view/zakat_calculate_history_view.dart';
import 'package:zakat_calculation_app/features/zakat_calculate_history/view_model/binding.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.CALCULATE,
        page: () => const CalculateView(),
        binding: CalculateBinding()),
    GetPage(
        name: AppRoutes.CALCULATE_HISTORY,
        page: () => const ZakatCalculateHistoryView(),
        binding: ZakatCalculateHistoryBinding()),
    GetPage(
        name: AppRoutes.CURRENCY_RATE,
        page: () => const CurrencyRateView(),
        binding: CurrencyRateBinding()),
    GetPage(
        name: AppRoutes.CALCULATE_HOW,
        page: () => const CalculateHowView(),
        binding: CalculateHowBinding()),
    GetPage(
        name: AppRoutes.CALCULATE_GOLD,
        page: () => CalculateGoldView(),
        binding: CalculateBinding()),
    GetPage(
        name: AppRoutes.CALCULATE_DOLAR,
        page: () => CalculateDolarView(),
        binding: CalculateBinding()),
    GetPage(
        name: AppRoutes.CALCULATE_EURO,
        page: () => CalculateEuroView(),
        binding: CalculateBinding()),
  ];
}
