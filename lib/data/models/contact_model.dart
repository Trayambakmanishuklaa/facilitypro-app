class ContactModel {
  final String name;
  final String company;
  final String email;
  final String phone;
  final String serviceRequired;
  final String message;

  ContactModel({
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.serviceRequired,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'company': company,
      'email': email,
      'phone': phone,
      'serviceRequired': serviceRequired,
      'message': message,
    };
  }
}
