import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../core/utils/helpers.dart';
import '../../../data/models/job_model.dart';
import '../../../data/models/career_application_model.dart';
import '../../../data/repositories/facility_repository.dart';

class CareersController extends GetxController {
  final FacilityRepository _repository = Get.find<FacilityRepository>();

  final RxBool isLoading = true.obs;
  final RxList<JobModel> jobs = <JobModel>[].obs;

  // Form Fields
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final experienceController = TextEditingController();
  final qualificationController = TextEditingController();
  final messageController = TextEditingController();

  final RxString selectedPosition = ''.obs;
  final RxString selectedFileName = ''.obs;
  final RxString selectedFilePath = ''.obs;
  final RxBool isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadJobs();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    experienceController.dispose();
    qualificationController.dispose();
    messageController.dispose();
    super.onClose();
  }

  Future<void> loadJobs() async {
    isLoading.value = true;
    try {
      final list = await _repository.fetchJobs();
      jobs.assignAll(list);
    } finally {
      isLoading.value = false;
    }
  }

  void selectPosition(String position) {
    selectedPosition.value = position;
  }

  Future<void> pickResume() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.single.path != null) {
        final file = result.files.single;
        if (file.size > 5 * 1024 * 1024) {
          Helpers.showErrorSnackBar(
            title: 'File Too Large',
            message: 'Please select a resume file under 5MB.',
          );
          return;
        }
        selectedFileName.value = file.name;
        selectedFilePath.value = file.path!;
      }
    } catch (e) {
      Helpers.showErrorSnackBar(title: 'File Picker Error', message: e.toString());
    }
  }

  Future<void> submitApplication() async {
    if (!formKey.currentState!.validate()) return;
    if (selectedFileName.value.isEmpty || selectedFilePath.value.isEmpty) {
      Helpers.showErrorSnackBar(
        title: 'Resume Required',
        message: 'Please upload your resume (PDF/DOCX).',
      );
      return;
    }

    isSubmitting.value = true;
    try {
      final file = File(selectedFilePath.value);
      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);

      final application = CareerApplicationModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        location: locationController.text.trim(),
        positionAppliedFor: selectedPosition.value.isEmpty ? 'General Application' : selectedPosition.value,
        experience: experienceController.text.trim(),
        qualification: qualificationController.text.trim(),
        resumeName: selectedFileName.value,
        resumeBase64: base64String,
        message: messageController.text.trim(),
      );

      await _repository.submitCareer(application);

      Helpers.showSuccessSnackBar(
        title: 'Application Submitted',
        message: 'Your job application and resume have been uploaded successfully to MongoDB!',
      );
      _clearForm();
      Get.back();
    } catch (e) {
      Helpers.showErrorSnackBar(title: 'Submission Error', message: e.toString());
    } finally {
      isSubmitting.value = false;
    }
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    locationController.clear();
    experienceController.clear();
    qualificationController.clear();
    messageController.clear();
    selectedPosition.value = '';
    selectedFileName.value = '';
    selectedFilePath.value = '';
  }
}
