import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../../data/models/quote_model.dart';
import '../../../data/repositories/facility_repository.dart';

class QuoteController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final designationController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final requirementDetailsController = TextEditingController();
  final messageController = TextEditingController();

  final RxString selectedPropertyType = 'Commercial Office'.obs;
  final RxString selectedServiceRequired = 'Integrated Facility Management'.obs;
  final RxBool isSubmitting = false.obs;

  final List<String> propertyTypeOptions = [
    'Commercial Office',
    'Shopping Mall / Retail',
    'Hospital / Healthcare Facility',
    'Residential Complex',
    'Hotel / Hospitality',
    'Educational Campus',
    'Industrial / Warehouse',
  ];

  final List<String> serviceOptions = [
    'Integrated Facility Management',
    'Soft Services',
    'Engineering & MEP Services',
    'Healthcare Facility Support',
    'Complete Facility Turnkey Solution',
  ];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is String) {
      final initialService = Get.arguments as String;
      if (serviceOptions.contains(initialService)) {
        selectedServiceRequired.value = initialService;
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    companyController.dispose();
    designationController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    requirementDetailsController.dispose();
    messageController.dispose();
    super.onClose();
  }

  Future<void> submitQuote() async {
    if (!formKey.currentState!.validate()) return;

    isSubmitting.value = true;
    try {
      final quote = QuoteModel(
        name: nameController.text.trim(),
        company: companyController.text.trim(),
        designation: designationController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        location: locationController.text.trim(),
        propertyType: selectedPropertyType.value,
        serviceRequired: selectedServiceRequired.value,
        requirementDetails: requirementDetailsController.text.trim(),
        message: messageController.text.trim(),
      );

      final success = await _repository.submitQuote(quote);
      if (success) {
        Helpers.showSuccessSnackBar(
          title: 'Quote Requested',
          message: 'Thank you! Your quote request has been submitted. Our sales team will get back to you shortly.',
        );
        _clearForm();
      } else {
        Helpers.showErrorSnackBar(
          title: 'Error',
          message: 'Could not submit quote request. Please try again.',
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
    designationController.clear();
    emailController.clear();
    phoneController.clear();
    locationController.clear();
    requirementDetailsController.clear();
    messageController.clear();
  }
}
