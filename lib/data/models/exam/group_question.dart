class GroupQuestionModel {
  String group;
  int type;
  String image;
  String audio;
  String transcript;
  List<QuestionModel> questions;
  String passage;
  String exam;
  String label;

  GroupQuestionModel({
    this.group = "",
    this.type = 0,
    this.image = "",
    this.audio = "",
    this.transcript = "",
    this.questions = const [],
    this.passage = "",
    this.exam = "",
    this.label = "",
  });

  factory GroupQuestionModel.fromJson(Map<String, dynamic> json) {
    List<QuestionModel> questions = [];
    for (var question in json['questions'] ?? []) {
      questions.add(QuestionModel.fromJson(question));
    }
    questions.sort((a, b) => a.number.compareTo(b.number));
    return GroupQuestionModel(
      group: json['group'] ?? "",
      type: json['type'] ?? 0,
      image: json['image'] ?? "",
      audio: json['audio'] ?? "",
      transcript: json['transcript'] ?? "",
      questions: questions,
      passage: json['passage'] ?? "",
      exam: json['exam'] ?? "",
      label: json['label'] ?? "",
    );
  }
  QuestionModel minQuestion() {
    return questions.reduce(
        (current, next) => (current.number < next.number) ? current : next);
  }

  void sort() {}
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> questions = [];
    for (var question in this.questions) {
      questions.add(question.toJson());
    }

    return {
      'group': this.group,
      'type': this.type,
      'image': this.image,
      'audio': this.audio,
      'transcript': this.transcript,
      'questions': questions,
      'passages': passage,
      'exam': this.exam,
      'label': this.label,
    };
  }
}

class QuestionModel {
  int number;
  String? question;
  String? A;
  String? B;
  String? C;
  String? D;
  String? correctAnswer;

  QuestionModel({
    this.number = 0,
    this.question,
    this.A,
    this.B,
    this.C,
    this.D,
    this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      number: json['number'] ?? 0,
      question: json['question'] ?? "",
      A: json['A'] ?? "",
      B: json['B'] ?? "",
      C: json['C'] ?? "",
      D: json['D'] ?? "",
      correctAnswer: json['correct_answer'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': this.number,
      'question': this.question,
      'A': this.A,
      'B': this.B,
      'C': this.C,
      'D': this.D,
      'correct_answer': this.correctAnswer,
    };
  }
}

class PassageModel {
  int number;
  String content;
  String image;

  PassageModel({
    required this.number,
    required this.content,
    required this.image,
  });

  factory PassageModel.fromJson(Map<String, dynamic> json) {
    return PassageModel(
      number: json['number'] ?? 0,
      content: json['content'] ?? "",
      image: json['image'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['content'] = this.content;
    data['image'] = this.image;
    return data;
  }
}
