import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../../data/models/contact_model.dart';
import '../../../data/repositories/facility_repository.dart';

class ContactController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  final RxString selectedService = 'Integrated Facility Management'.obs;
  final RxBool isSubmitting = false.obs;

  final List<String> serviceOptions = [
    'Integrated Facility Management',
    'Soft Services',
    'Engineering & MEP Services',
    'Healthcare Facility Support',
    'Security Services',
    'Energy & Sustainability',
    'General Inquiry',
  ];

  @override
  void onClose() {
    nameController.dispose();
    companyController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }

  Future<void> submitContact() async {
    if (!formKey.currentState!.validate()) return;

    isSubmitting.value = true;
    try {
      final contact = ContactModel(
        name: nameController.text.trim(),
        company: companyController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        serviceRequired: selectedService.value,
        message: messageController.text.trim(),
      );

      final success = await _repository.submitContact(contact);
      if (success) {
        Helpers.showSuccessSnackBar(
          title: 'Message Sent',
          message: 'Thank you! We have received your query and will contact you soon.',
        );
        _clearForm();
      } else {
        Helpers.showErrorSnackBar(
          title: 'Submission Failed',
          message: 'Could not send message. Please try again.',
        );
      }
    } catch (e) {
      Helpers.showErrorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isSubmitting.value = false;
    }
  }

  void _clearForm() {
    nameController.clear();
    companyController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
    selectedService.value = serviceOptions.first;
  }
}
