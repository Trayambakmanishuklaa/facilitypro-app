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
        title: const Text('More Options'),
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
                      children: const [
                        Text(
                          AppConstants.appName,
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text(
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
              icon: Icons.info_outline_rounded,
              title: 'About FacilityPro',
              subtitle: 'Mission, vision & corporate capabilities',
              onTap: () => Get.toNamed(Routes.ABOUT),
            ),
            _buildMenuItem(
              icon: Icons.domain_rounded,
              title: 'Industries Served',
              subtitle: 'Commercial, Malls, Healthcare & Residential',
              onTap: () => Get.toNamed(Routes.INDUSTRIES),
            ),
            _buildMenuItem(
              icon: Icons.contact_support_outlined,
              title: 'Contact Us',
              subtitle: 'Get in touch with support & sales team',
              onTap: () => Get.toNamed(Routes.CONTACT),
            ),
            _buildMenuItem(
              icon: Icons.request_quote_outlined,
              title: 'Request a Quote',
              subtitle: 'Get a custom facility estimate for your property',
              onTap: () => Get.toNamed(Routes.QUOTE),
            ),
            _buildMenuItem(
              icon: Icons.work_outline_rounded,
              title: 'Careers & Opportunities',
              subtitle: 'Explore job openings and join our team',
              onTap: () => Get.toNamed(Routes.CAREERS),
            ),
            const Divider(height: 24),
            _buildMenuItem(
              icon: Icons.share_rounded,
              title: 'Share App',
              subtitle: 'Recommend FacilityPro to partners',
              onTap: controller.shareApp,
            ),
            _buildMenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              subtitle: 'Data security & privacy guidelines',
              onTap: () {
                Get.defaultDialog(
                  title: 'Privacy Policy',
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
              title: 'Terms & Conditions',
              subtitle: 'Usage terms for FacilityPro platform',
              onTap: () {
                Get.defaultDialog(
                  title: 'Terms & Conditions',
                  content: const SingleChildScrollView(
                    child: Text(
                      'By using FacilityPro mobile app, you agree to submit genuine facility enquiries. FacilityPro Pvt Ltd reserves all rights to service offerings.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'App Version ${AppConstants.appVersion}',
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
