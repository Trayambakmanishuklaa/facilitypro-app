import 'package:get/get.dart';
import '../controllers/industries_controller.dart';

class IndustriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndustriesController>(() => IndustriesController());
  }
}
