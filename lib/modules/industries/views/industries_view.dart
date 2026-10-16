import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controllers/industries_controller.dart';

class IndustriesView extends GetView<IndustriesController> {
  const IndustriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('industries_title'.tr),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingWidget(message: 'Loading industries...');
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.industries.length,
          itemBuilder: (context, index) {
            final industry = controller.industries[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomCard(
                padding: const EdgeInsets.all(12),
                onTap: () {
                  Get.toNamed(Routes.QUOTE, arguments: industry.name);
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        industry.imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 70,
                          height: 70,
                          color: AppColors.surfaceMuted,
                          child: const Icon(Icons.domain, color: AppColors.primary),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            industry.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            industry.description,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.primary),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
