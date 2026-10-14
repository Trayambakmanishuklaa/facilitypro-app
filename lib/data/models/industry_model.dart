class IndustryModel {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final String imageUrl;

  IndustryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.imageUrl,
  });

  factory IndustryModel.fromJson(Map<String, dynamic> json) {
    return IndustryModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      iconName: json['iconName'] ?? 'domain',
      imageUrl: json['imageUrl'] ?? 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconName': iconName,
      'imageUrl': imageUrl,
    };
  }
}
