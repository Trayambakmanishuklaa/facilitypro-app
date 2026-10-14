import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get in Touch with FacilityPro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Fill in the details below and our facility management team will contact you shortly.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: controller.nameController,
                label: 'Full Name *',
                prefixIcon: Icons.person_outline_rounded,
                validator: (v) => Helpers.validateRequired(v, 'Name'),
              ),
              CustomTextField(
                controller: controller.companyController,
                label: 'Company / Organization *',
                prefixIcon: Icons.business_outlined,
                validator: (v) => Helpers.validateRequired(v, 'Company'),
              ),
              CustomTextField(
                controller: controller.emailController,
                label: 'Email Address *',
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
              const Text(
                'Service Required *',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 6),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedService.value,
                  items: controller.serviceOptions
                      .map((s) => DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(fontSize: 13))))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) controller.selectedService.value = val;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.miscellaneous_services_outlined, size: 20, color: AppColors.textSecondary),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: controller.messageController,
                label: 'Message / Special Requirements *',
                hint: 'Tell us more about your property and requirements...',
                maxLines: 4,
                validator: (v) => Helpers.validateRequired(v, 'Message'),
              ),
              const SizedBox(height: 12),
              Obx(
                () => CustomButton(
                  text: 'Submit Enquiry',
                  icon: Icons.send_rounded,
                  isLoading: controller.isSubmitting.value,
                  onPressed: controller.submitContact,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
