
class CategoryItemModel {
  String name;
  String image;
  String description;
  String id;
  int count;

  CategoryItemModel({
    this.name = "",
    this.image = "",
    this.description = "",
    this.count = 0,
    this.id = "",
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      count: json['count'] ?? 0,
      id: json['id'],
    );
  }
}
