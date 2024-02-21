import 'package:get/get.dart';
import 'package:zakat_calculation_app/features/currency_rate/view_model/controller.dart';

class CurrencyRateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurrencyRateController());
  }
}
