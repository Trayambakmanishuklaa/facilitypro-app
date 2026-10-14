class JobModel {
  final String id;
  final String title;
  final String location;
  final String experience;
  final String department;
  final String employmentType;
  final String description;
  final List<String> requirements;

  JobModel({
    required this.id,
    required this.title,
    required this.location,
    required this.experience,
    required this.department,
    required this.employmentType,
    required this.description,
    required this.requirements,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['_id'] ?? json['id'] ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? 'Gurugram',
      experience: json['experience'] ?? '2+ Years',
      department: json['department'] ?? 'Operations',
      employmentType: json['employmentType'] ?? 'Full-Time',
      description: json['description'] ?? '',
      requirements: List<String>.from(json['requirements'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'experience': experience,
      'department': department,
      'employmentType': employmentType,
      'description': description,
      'requirements': requirements,
    };
  }
}
