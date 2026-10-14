import 'package:get/get.dart';
import '../../core/network/api_client.dart';
import '../../data/providers/api_provider.dart';
import '../../data/repositories/facility_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiClient>(ApiClient(), permanent: true);
    Get.put<ApiProvider>(ApiProvider(Get.find<ApiClient>()), permanent: true);
    Get.put<FacilityRepository>(FacilityRepository(Get.find<ApiProvider>()), permanent: true);
  }
}
