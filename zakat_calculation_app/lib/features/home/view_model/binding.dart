import 'package:get/get.dart';
import 'package:zakat_calculation_app/features/home/view_model/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
