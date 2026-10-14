import 'package:get/get.dart';
import '../../../data/models/project_model.dart';
import '../../../data/repositories/facility_repository.dart';

class ProjectsController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final RxBool isLoading = true.obs;
  final RxList<ProjectModel> projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  Future<void> loadProjects() async {
    isLoading.value = true;
    try {
      final list = await _repository.fetchProjects();
      projects.assignAll(list);
    } finally {
      isLoading.value = false;
    }
  }
}
