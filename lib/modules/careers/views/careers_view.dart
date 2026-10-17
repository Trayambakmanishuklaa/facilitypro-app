import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controllers/careers_controller.dart';

class CareersView extends GetView<CareersController> {
  const CareersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('careers_title'.tr),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingWidget(message: 'Loading career openings...');
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.accent],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'careers_banner_title'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'careers_banner_sub'.tr,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'open_positions'.tr,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              ...controller.jobs.map((job) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  job.title,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                ),
                              ),
                              Chip(
                                label: Text(
                                  job.employmentType,
                                  style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: AppColors.primary.withOpacity(0.08),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                              const SizedBox(width: 4),
                              Text(job.location, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                              const SizedBox(width: 16),
                              const Icon(Icons.work_outline, size: 14, color: AppColors.textSecondary),
                              const SizedBox(width: 4),
                              Text(job.experience, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            job.description,
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.4),
                          ),
                          const SizedBox(height: 12),
                          CustomButton(
                            text: 'apply_position'.tr,
                            icon: Icons.send_rounded,
                            onPressed: () {
                              controller.selectPosition(job.title);
                              _showApplicationDialog(context, job.title);
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        );
      }),
    );
  }

  void _showApplicationDialog(BuildContext context, String positionTitle) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Apply: $positionTitle',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: controller.nameController,
                  label: 'full_name'.tr,
                  prefixIcon: Icons.person_outline,
                  validator: (v) => Helpers.validateRequired(v, 'Name'),
                ),
                CustomTextField(
                  controller: controller.emailController,
                  label: 'business_email'.tr,
                  prefixIcon: Icons.email_outlined,
                  validator: Helpers.validateEmail,
                ),
                CustomTextField(
                  controller: controller.phoneController,
                  label: 'phone_number'.tr,
                  prefixIcon: Icons.phone_outlined,
                  validator: Helpers.validatePhone,
                ),
                CustomTextField(
                  controller: controller.locationController,
                  label: 'current_city'.tr,
                  prefixIcon: Icons.location_city_outlined,
                  validator: (v) => Helpers.validateRequired(v, 'City'),
                ),
                CustomTextField(
                  controller: controller.experienceController,
                  label: 'total_experience'.tr,
                  prefixIcon: Icons.access_time,
                  validator: (v) => Helpers.validateRequired(v, 'Experience'),
                ),
                CustomTextField(
                  controller: controller.qualificationController,
                  label: 'highest_qualification'.tr,
                  prefixIcon: Icons.school_outlined,
                  validator: (v) => Helpers.validateRequired(v, 'Qualification'),
                ),
                Text(
                  'upload_resume'.tr,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 6),
                Obx(
                  () => OutlinedButton.icon(
                    onPressed: controller.pickResume,
                    icon: const Icon(Icons.upload_file_rounded),
                    label: Text(
                      controller.selectedFileName.value.isEmpty
                          ? 'select_resume'.tr
                          : controller.selectedFileName.value,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: controller.messageController,
                  label: 'cover_note'.tr,
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => CustomButton(
                    text: 'submit_application'.tr,
                    isLoading: controller.isSubmitting.value
                    ,
                    onPressed: controller.submitApplication,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
