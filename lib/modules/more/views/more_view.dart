import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('more_title'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.primary,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.apartment_rounded, color: Colors.white, size: 36),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'app_name'.tr,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          AppConstants.companyName,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.language_rounded,
              title: 'language'.tr,
              subtitle: 'select_language'.tr,
              onTap: () {
                final isHindi = Get.locale?.languageCode == 'hi';
                Get.defaultDialog(
                  title: 'select_language'.tr,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(
                          !isHindi ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                          color: AppColors.primary,
                        ),
                        title: Text('english'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () {
                          controller.changeLanguage('en', 'US');
                          Get.back();
                        },
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: Icon(
                          isHindi ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                          color: AppColors.primary,
                        ),
                        title: Text('hindi'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () {
                          controller.changeLanguage('hi', 'IN');
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.info_outline_rounded,
              title: 'about_title'.tr,
              subtitle: 'about_sub'.tr,
              onTap: () => Get.toNamed(Routes.ABOUT),
            ),
            _buildMenuItem(
              icon: Icons.domain_rounded,
              title: 'industries_title'.tr,
              subtitle: 'ind_sub'.tr,
              onTap: () => Get.toNamed(Routes.INDUSTRIES),
            ),
            _buildMenuItem(
              icon: Icons.contact_support_outlined,
              title: 'contact_title'.tr,
              subtitle: 'contact_menu_sub'.tr,
              onTap: () => Get.toNamed(Routes.CONTACT),
            ),
            _buildMenuItem(
              icon: Icons.request_quote_outlined,
              title: 'quote_title'.tr,
              subtitle: 'quote_menu_sub'.tr,
              onTap: () => Get.toNamed(Routes.QUOTE),
            ),
            _buildMenuItem(
              icon: Icons.work_outline_rounded,
              title: 'careers_title'.tr,
              subtitle: 'careers_menu_sub'.tr,
              onTap: () => Get.toNamed(Routes.CAREERS),
            ),
            const Divider(height: 24),
            _buildMenuItem(
              icon: Icons.share_rounded,
              title: 'share_app'.tr,
              subtitle: 'share_menu_sub'.tr,
              onTap: controller.shareApp,
            ),
            _buildMenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'privacy_policy'.tr,
              subtitle: 'privacy_menu_sub'.tr,
              onTap: () {
                Get.defaultDialog(
                  title: 'privacy_policy'.tr,
                  content: const SingleChildScrollView(
                    child: Text(
                      'FacilityPro is committed to protecting customer data. All enquiries and quote requests submitted via this mobile app are encrypted and stored securely.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.gavel_rounded,
              title: 'terms_conditions'.tr,
              subtitle: 'terms_menu_sub'.tr,
              onTap: () {
                Get.defaultDialog(
                  title: 'terms_conditions'.tr,
                  content: const SingleChildScrollView(
                    child: Text(
                      'By using FacilityPro mobile app, you agree to submit genuine facility enquiries. FacilityPro Pvt Ltd reserves all rights to service offerings.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            Text(
              '${'app_version'.tr} ${AppConstants.appVersion}',
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
      onTap: onTap,
    );
  }
}
