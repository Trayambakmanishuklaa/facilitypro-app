import 'package:get/get.dart';
import '../../../data/models/service_model.dart';
import '../../../data/models/industry_model.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/faq_model.dart';
import '../../../data/repositories/facility_repository.dart';

class HomeController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final RxBool isLoading = true.obs;
  final RxList<ServiceModel> featuredServices = <ServiceModel>[].obs;
  final RxList<IndustryModel> industries = <IndustryModel>[].obs;
  final RxList<ProjectModel> featuredProjects = <ProjectModel>[].obs;
  final RxList<FaqModel> faqs = <FaqModel>[].obs;

  final RxInt expandedFaqIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    isLoading.value = true;
    try {
      final servicesList = await _repository.fetchServices();
      featuredServices.assignAll(servicesList);

      final indList = await _repository.fetchIndustries();
      industries.assignAll(indList);

      final projList = await _repository.fetchProjects();
      featuredProjects.assignAll(projList);

      final faqList = await _repository.fetchFaqs();
      faqs.assignAll(faqList);
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFaq(int index) {
    if (expandedFaqIndex.value == index) {
      expandedFaqIndex.value = -1;
    } else {
      expandedFaqIndex.value = index;
    }
  }
}
