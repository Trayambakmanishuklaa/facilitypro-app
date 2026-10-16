import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/language_selection_controller.dart';

class LanguageSelectionView extends GetView<LanguageSelectionController> {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.language_rounded, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Text(
                'Choose Your Language\nअपनी भाषा चुनें',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select your preferred language to continue using FacilityPro.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              Obx(
                () => Column(
                  children: [
                    _buildLangCard(
                      title: 'English',
                      subtitle: 'Continue in English',
                      isSelected: controller.selectedLang.value == 'en',
                      onTap: () => controller.selectLanguage('en'),
                    ),
                    const SizedBox(height: 16),
                    _buildLangCard(
                      title: 'हिंदी (Hindi)',
                      subtitle: 'हिंदी में जारी रखें',
                      isSelected: controller.selectedLang.value == 'hi',
                      onTap: () => controller.selectLanguage('hi'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: controller.confirmLanguage,
                child: const Text(
                  'Continue / आगे बढ़ें',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white30,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.primary : Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected ? AppColors.textSecondary : Colors.white70,
                  ),
                ),
              ],
            ),
            Icon(
              isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: isSelected ? AppColors.primary : Colors.white60,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}
