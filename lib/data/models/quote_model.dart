class QuoteModel {
  final String name;
  final String company;
  final String designation;
  final String email;
  final String phone;
  final String location;
  final String propertyType;
  final String serviceRequired;
  final String requirementDetails;
  final String message;

  QuoteModel({
    required this.name,
    required this.company,
    required this.designation,
    required this.email,
    required this.phone,
    required this.location,
    required this.propertyType,
    required this.serviceRequired,
    required this.requirementDetails,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'company': company,
      'designation': designation,
      'email': email,
      'phone': phone,
      'location': location,
      'propertyType': propertyType,
      'serviceRequired': serviceRequired,
      'requirementDetails': requirementDetails,
      'message': message,
    };
  }
}
