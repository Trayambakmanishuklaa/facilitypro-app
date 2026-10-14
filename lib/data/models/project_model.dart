class ProjectModel {
  final String id;
  final String name;
  final String location;
  final String industry;
  final List<String> servicesProvided;
  final String description;
  final String imageUrl;

  ProjectModel({
    required this.id,
    required this.name,
    required this.location,
    required this.industry,
    required this.servicesProvided,
    required this.description,
    required this.imageUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      industry: json['industry'] ?? '',
      servicesProvided: List<String>.from(json['servicesProvided'] ?? []),
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? 'https://images.unsplash.com/photo-1541888946425-d0fbb186a5b3?auto=format&fit=crop&w=800&q=80',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'industry': industry,
      'servicesProvided': servicesProvided,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
