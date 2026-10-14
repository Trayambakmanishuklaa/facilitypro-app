class ServiceModel {
  final String id;
  final String title;
  final String category;
  final String summary;
  final String description;
  final List<String> capabilities;
  final List<String> benefits;
  final String imageUrl;
  final String iconName;
  final bool isFeatured;

  ServiceModel({
    required this.id,
    required this.title,
    required this.category,
    required this.summary,
    required this.description,
    required this.capabilities,
    required this.benefits,
    required this.imageUrl,
    required this.iconName,
    this.isFeatured = false,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'] ?? json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? 'General',
      summary: json['summary'] ?? '',
      description: json['description'] ?? '',
      capabilities: List<String>.from(json['capabilities'] ?? []),
      benefits: List<String>.from(json['benefits'] ?? []),
      imageUrl: json['imageUrl'] ?? 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=800&q=80',
      iconName: json['iconName'] ?? 'business',
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'summary': summary,
      'description': description,
      'capabilities': capabilities,
      'benefits': benefits,
      'imageUrl': imageUrl,
      'iconName': iconName,
      'isFeatured': isFeatured,
    };
  }
}
