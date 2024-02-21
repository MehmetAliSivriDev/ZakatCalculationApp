import 'package:get/get.dart';
import 'package:zakat_calculation_app/features/calculate_how/view_model/controller.dart';

class CalculateHowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateHowController());
  }
}
