import 'package:get/get.dart';
import 'package:zakat_calculation_app/features/calculate/view_model/controller.dart';

class CalculateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateController());
  }
}
