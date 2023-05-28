class LessionModel {
  String id;
  String name;
  String description;
  String content;
  String thumbail;

  LessionModel({
    this.id = "",
    this.name = "",
    this.description = "",
    this.content = "",
    this.thumbail = "",
  });

  factory LessionModel.fromJson(Map<String, dynamic> json) {
    return LessionModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      thumbail: json['thumbail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['content'] = content;
    data['thumbail'] = thumbail;

    return data;
  }
}
