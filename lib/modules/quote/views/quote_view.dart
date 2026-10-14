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
        title: const Text('Request a Quote'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Facility Management Quotation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Provide your property details for a tailored commercial facility quote.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: controller.nameController,
                label: 'Contact Name *',
                prefixIcon: Icons.person_outline_rounded,
                validator: (v) => Helpers.validateRequired(v, 'Name'),
              ),
              CustomTextField(
                controller: controller.companyController,
                label: 'Company Name *',
                prefixIcon: Icons.business_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Company Name'),
              ),
              CustomTextField(
                controller: controller.designationController,
                label: 'Designation / Role *',
                hint: 'e.g., Facility Director, General Manager',
                prefixIcon: Icons.badge_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Designation'),
              ),
              CustomTextField(
                controller: controller.emailController,
                label: 'Business Email *',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: Helpers.validateEmail,
              ),
              CustomTextField(
                controller: controller.phoneController,
                label: 'Phone Number *',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: Helpers.validatePhone,
              ),
              CustomTextField(
                controller: controller.locationController,
                label: 'Facility Location / City *',
                prefixIcon: Icons.location_city_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Location'),
              ),
              const Text(
                'Property Type *',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
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
              const Text(
                'Primary Service Required *',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
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
                label: 'Facility Area / Details *',
                hint: 'e.g. 150,000 sq ft, 12 floors, 24/7 operations',
                prefixIcon: Icons.aspect_ratio_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Area / Details'),
              ),
              CustomTextField(
                controller: controller.messageController,
                label: 'Additional Remarks',
                hint: 'Any specific SLAs or transition timeline requirements...',
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              Obx(
                () => CustomButton(
                  text: 'Submit Quote Request',
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
