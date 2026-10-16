import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_card.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about_title'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.apartment_rounded, size: 48, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    AppConstants.companyName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'tagline'.tr,
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'company_profile'.tr,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'about_profile_desc'.tr,
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb_rounded, color: AppColors.accent, size: 28),
                        const SizedBox(height: 8),
                        Text('our_mission'.tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(
                          'mission_desc'.tr,
                          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.visibility_rounded, color: AppColors.secondary, size: 28),
                        const SizedBox(height: 8),
                        Text('our_vision'.tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(
                          'vision_desc'.tr,
                          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'core_values'.tr,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                  const SizedBox(height: 12),
                  _buildValueTile('val_1_title'.tr, 'val_1_desc'.tr),
                  _buildValueTile('val_2_title'.tr, 'val_2_desc'.tr),
                  _buildValueTile('val_3_title'.tr, 'val_3_desc'.tr),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'corporate_contact'.tr,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 18, color: AppColors.textSecondary),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(AppConstants.companyAddress, style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.phone_rounded, size: 18, color: AppColors.textSecondary),
                      SizedBox(width: 8),
                      Text(AppConstants.supportPhone, style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.email_rounded, size: 18, color: AppColors.textSecondary),
                      SizedBox(width: 8),
                      Text(AppConstants.supportEmail, style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueTile(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, size: 16, color: AppColors.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary)),
                Text(desc, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
