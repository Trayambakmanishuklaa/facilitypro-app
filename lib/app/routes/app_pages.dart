import 'package:get/get.dart';
import 'app_routes.dart';

import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/main_navigation/bindings/main_navigation_binding.dart';
import '../../modules/main_navigation/views/main_navigation_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/services/bindings/services_binding.dart';
import '../../modules/services/views/services_view.dart';
import '../../modules/service_detail/bindings/service_detail_binding.dart';
import '../../modules/service_detail/views/service_detail_view.dart';
import '../../modules/industries/bindings/industries_binding.dart';
import '../../modules/industries/views/industries_view.dart';
import '../../modules/projects/bindings/projects_binding.dart';
import '../../modules/projects/views/projects_view.dart';
import '../../modules/about/bindings/about_binding.dart';
import '../../modules/about/views/about_view.dart';
import '../../modules/contact/bindings/contact_binding.dart';
import '../../modules/contact/views/contact_view.dart';
import '../../modules/quote/bindings/quote_binding.dart';
import '../../modules/quote/views/quote_view.dart';
import '../../modules/careers/bindings/careers_binding.dart';
import '../../modules/careers/views/careers_view.dart';
import '../../modules/more/bindings/more_binding.dart';
import '../../modules/more/views/more_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.MAIN_NAVIGATION,
      page: () => const MainNavigationView(),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SERVICES,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: Routes.SERVICE_DETAIL,
      page: () => const ServiceDetailView(),
      binding: ServiceDetailBinding(),
    ),
    GetPage(
      name: Routes.INDUSTRIES,
      page: () => const IndustriesView(),
      binding: IndustriesBinding(),
    ),
    GetPage(
      name: Routes.PROJECTS,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: Routes.QUOTE,
      page: () => const QuoteView(),
      binding: QuoteBinding(),
    ),
    GetPage(
      name: Routes.CAREERS,
      page: () => const CareersView(),
      binding: CareersBinding(),
    ),
    GetPage(
      name: Routes.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
  ];
}
