import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/service_detail_controller.dart';

class ServiceDetailView extends GetView<ServiceDetailController> {
  const ServiceDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final service = controller.service;

    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              service.imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 220,
                color: AppColors.primary,
                child: const Icon(Icons.business_center_rounded, size: 64, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      service.category,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    service.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'key_capabilities'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...service.capabilities.map((cap) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle_rounded, color: AppColors.accent, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                cap,
                                style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                  Text(
                    'business_benefits'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...service.benefits.map((ben) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.star_rounded, color: AppColors.secondary, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                ben,
                                style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'request_quote_service'.tr,
                    icon: Icons.request_quote_rounded,
                    onPressed: () {
                      Get.toNamed(Routes.QUOTE, arguments: service.title);
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'contact_consultant'.tr,
                    icon: Icons.phone_in_talk_rounded,
                    isOutlined: true,
                    onPressed: () {
                      Get.toNamed(Routes.CONTACT);
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
