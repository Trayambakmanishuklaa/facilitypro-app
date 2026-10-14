import 'package:get/get.dart';
import '../../../data/models/service_model.dart';
import '../../../data/repositories/facility_repository.dart';

class ServicesController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final RxBool isLoading = true.obs;
  final RxList<ServiceModel> allServices = <ServiceModel>[].obs;
  final RxList<ServiceModel> filteredServices = <ServiceModel>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadServices();
  }

  Future<void> loadServices() async {
    isLoading.value = true;
    try {
      final list = await _repository.fetchServices();
      allServices.assignAll(list);
      filterServices(searchQuery.value);
    } finally {
      isLoading.value = false;
    }
  }

  void filterServices(String query) {
    searchQuery.value = query;
    if (query.trim().isEmpty) {
      filteredServices.assignAll(allServices);
    } else {
      filteredServices.assignAll(
        allServices.where((s) =>
            s.title.toLowerCase().contains(query.toLowerCase()) ||
            s.category.toLowerCase().contains(query.toLowerCase()) ||
            s.summary.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}
