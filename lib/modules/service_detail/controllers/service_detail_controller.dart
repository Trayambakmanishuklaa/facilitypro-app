import 'package:get/get.dart';
import '../../../data/models/service_model.dart';

class ServiceDetailController extends GetxController {
  late ServiceModel service;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is ServiceModel) {
      service = Get.arguments as ServiceModel;
    }
  }
}
