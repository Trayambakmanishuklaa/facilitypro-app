import 'package:get/get.dart';
import '../../../data/models/industry_model.dart';
import '../../../data/repositories/facility_repository.dart';

class IndustriesController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final RxBool isLoading = true.obs;
  final RxList<IndustryModel> industries = <IndustryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIndustries();
  }

  Future<void> loadIndustries() async {
    isLoading.value = true;
    try {
      final list = await _repository.fetchIndustries();
      industries.assignAll(list);
    } finally {
      isLoading.value = false;
    }
  }
}
