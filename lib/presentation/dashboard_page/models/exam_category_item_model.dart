class ExamCategoryItemModel {
  String name;
  String image;
  String description;
  String id;
  int count;

  ExamCategoryItemModel({
    this.name = "",
    this.image = "",
    this.description = "",
    this.count = 0,
    this.id = "",
  });

  factory ExamCategoryItemModel.fromJson(Map<String, dynamic> json) {
    return ExamCategoryItemModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      count: json['count'] ?? 0,
      id: json['id'],
    );
  }
}
