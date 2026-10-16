import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/quote_controller.dart';

class QuoteView extends GetView<QuoteController> {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('quote_title'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'quote_title'.tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'quote_sub'.tr,
                style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: controller.nameController,
                label: 'full_name'.tr,
                prefixIcon: Icons.person_outline_rounded,
                validator: (v) => Helpers.validateRequired(v, 'Name'),
              ),
              CustomTextField(
                controller: controller.companyController,
                label: 'company_org'.tr,
                prefixIcon: Icons.business_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Company Name'),
              ),
              CustomTextField(
                controller: controller.designationController,
                label: 'Designation / Role *',
                prefixIcon: Icons.badge_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Designation'),
              ),
              CustomTextField(
                controller: controller.emailController,
                label: 'business_email'.tr,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: Helpers.validateEmail,
              ),
              CustomTextField(
                controller: controller.phoneController,
                label: 'phone_number'.tr,
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: Helpers.validatePhone,
              ),
              CustomTextField(
                controller: controller.locationController,
                label: 'facility_location'.tr,
                prefixIcon: Icons.location_city_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Location'),
              ),
              Text(
                'property_type'.tr,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 6),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedPropertyType.value,
                  items: controller.propertyTypeOptions
                      .map((p) => DropdownMenuItem(value: p, child: Text(p, style: const TextStyle(fontSize: 13))))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) controller.selectedPropertyType.value = val;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.domain_outlined, size: 20, color: AppColors.textSecondary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'service_required'.tr,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 6),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedServiceRequired.value,
                  items: controller.serviceOptions
                      .map((s) => DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(fontSize: 13))))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) controller.selectedServiceRequired.value = val;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.settings_suggest_outlined, size: 20, color: AppColors.textSecondary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: controller.requirementDetailsController,
                label: 'facility_area'.tr,
                prefixIcon: Icons.aspect_ratio_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Area / Details'),
              ),
              CustomTextField(
                controller: controller.messageController,
                label: 'additional_remarks'.tr,
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              Obx(
                () => CustomButton(
                  text: 'submit_quote_req'.tr,
                  icon: Icons.check_circle_outline_rounded,
                  isLoading: controller.isSubmitting.value,
                  onPressed: controller.submitQuote,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
