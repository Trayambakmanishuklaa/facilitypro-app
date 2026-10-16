import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/routes/app_routes.dart';

class LanguageSelectionController extends GetxController {
  final RxString selectedLang = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    final box = GetStorage();
    final currentLang = box.read('lang') ?? 'en';
    selectedLang.value = currentLang;
  }

  void selectLanguage(String lang) {
    selectedLang.value = lang;
  }

  void confirmLanguage() {
    final box = GetStorage();
    box.write('is_lang_selected', true);
    if (selectedLang.value == 'hi') {
      box.write('lang', 'hi');
      box.write('country', 'IN');
      Get.updateLocale(const Locale('hi', 'IN'));
    } else {
      box.write('lang', 'en');
      box.write('country', 'US');
      Get.updateLocale(const Locale('en', 'US'));
    }
    Get.offAllNamed(Routes.MAIN_NAVIGATION);
  }
}
