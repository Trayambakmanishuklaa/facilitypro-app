import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import 'bindings/initial_binding.dart';
import 'routes/app_pages.dart';

class FacilityProApp extends StatelessWidget {
  const FacilityProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
    );
  }
}
