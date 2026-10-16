import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../core/constants/app_constants.dart';
import '../core/localization/app_translations.dart';
import '../core/theme/app_theme.dart';
import 'bindings/initial_binding.dart';
import 'routes/app_pages.dart';

class FacilityProApp extends StatelessWidget {
  const FacilityProApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final savedLang = box.read('lang') ?? 'en';
    final savedCountry = box.read('country') ?? 'US';

    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      translations: AppTranslations(),
      locale: Locale(savedLang, savedCountry),
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: InitialBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
    );
  }
}
