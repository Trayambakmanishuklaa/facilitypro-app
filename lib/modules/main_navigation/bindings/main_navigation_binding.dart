import 'package:get/get.dart';
import '../controllers/main_navigation_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../services/controllers/services_controller.dart';
import '../../projects/controllers/projects_controller.dart';
import '../../more/controllers/more_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavigationController>(() => MainNavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ServicesController>(() => ServicesController());
    Get.lazyPut<ProjectsController>(() => ProjectsController());
    Get.lazyPut<MoreController>(() => MoreController());
  }
}
