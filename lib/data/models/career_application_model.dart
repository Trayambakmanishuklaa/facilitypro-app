class CareerApplicationModel {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String positionAppliedFor;
  final String experience;
  final String qualification;
  final String resumeName;
  final String resumeBase64;
  final String message;

  CareerApplicationModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.positionAppliedFor,
    required this.experience,
    required this.qualification,
    required this.resumeName,
    required this.resumeBase64,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'positionAppliedFor': positionAppliedFor,
      'experience': experience,
      'qualification': qualification,
      'resumeName': resumeName,
      'resumeBase64': resumeBase64,
      'message': message,
    };
  }
}
