import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/utils/helpers.dart';

class MoreController extends GetxController {
  void shareApp() {
    Share.share(
      'Check out FacilityPro Mobile App for professional facility management services!\nhttps://facilitypro.example.com',
    );
  }

  void changeLanguage(String langCode, String countryCode) {
    final box = GetStorage();
    box.write('lang', langCode);
    box.write('country', countryCode);
    Get.updateLocale(Locale(langCode, countryCode));
    Get.forceAppUpdate();
    Helpers.showSuccessSnackBar(
      title: 'Language Updated',
      message: 'App language has been updated successfully.',
    );
  }
}
