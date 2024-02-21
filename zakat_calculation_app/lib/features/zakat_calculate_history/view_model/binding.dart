import 'package:get/get.dart';
import 'package:zakat_calculation_app/features/zakat_calculate_history/view_model/controller.dart';

class ZakatCalculateHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ZakatCalculateHistoryController());
  }
}
