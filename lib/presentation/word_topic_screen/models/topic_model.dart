class TopicModel {
  final String id;
  final String image;
  final String name;
  final List<WordModel> words;
  int count = 0;
  TopicModel(
      {this.id = "",
      this.image = "",
      this.name = "",
      required this.words,
      this.count = 0});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    final wordsJson = json['words'] as List;
    int _count = wordsJson.length;
    List<WordModel> words = [];
    if (wordsJson.length > 0 && !(wordsJson[0] is String)) {
      words =
          wordsJson.map((wordJson) => WordModel.fromJson(wordJson)).toList();
    } else {
      _count = wordsJson.length;
    }

    return TopicModel(
        id: json['id'] as String,
        image: json['image'] as String,
        name: json['name'] as String,
        words: words,
        count: _count);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'words': words.map((word) => word.toJson()).toList(),
      };
}

class WordModel {
  String id;
  String name;
  String definition;
  String example;
  String image;
  String mean;
  String pronounce;
  String sound;
  String type;

  WordModel({
    required this.id,
    required this.name,
    required this.definition,
    required this.example,
    required this.image,
    required this.mean,
    required this.pronounce,
    required this.sound,
    required this.type,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      definition: json['definition'] as String,
      example: json['example'] as String,
      image: json['image'] as String,
      mean: json['mean'] as String,
      pronounce: json['pronounce'] as String,
      sound: json['sound'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['definition'] = definition;
    data['example'] = example;
    data['image'] = image;
    data['mean'] = mean;
    data['pronounce'] = pronounce;
    data['sound'] = sound;
    data['type'] = type;
    return data;
  }
}
