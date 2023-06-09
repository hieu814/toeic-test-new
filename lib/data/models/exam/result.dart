import 'package:toeic_test/data/models/exam/exam.dart';

class Result {
  String? id;
  String? userId;
  String? examId;
  List<Answer> answers;
  bool? isDeleted;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? addedBy;
  String? updatedBy;
  ExamModel? exam;
  Result(
      {this.id,
      this.userId,
      this.examId,
      this.answers = const [],
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.exam});
  Score getScore() {
    int _correct = 0;
    int _blank = 0;
    int _incorrect = 0;
    for (var element in answers) {
      if (element.answer.isEmpty) {
        _blank++;
      } else if (element.answer == element.correctAnswer) {
        _correct++;
      } else {
        _incorrect++;
      }
    }
    return Score(
        blank: _blank,
        correct: _correct,
        total: answers.length,
        incorrect: _incorrect);
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    // print(json['id']);
    var answersList = (json['answers'] ?? []) as List;
    List<Answer> answers =
        answersList.map((answer) => Answer.fromJson(answer)).toList();
    String examid = json['exam'] is String ? json['exam'] : "";
    ExamModel? examss;
    if (json['exam'] is Map<String, dynamic>) {
      examss = ExamModel(name: json['exam']?["name"] ?? "");
    }
    return Result(
        id: json['id'] ?? "",
        userId: json['userId'] ?? "",
        examId: examid,
        answers: answers,
        isDeleted: json['isDeleted'] ?? true,
        isActive: json['isActive'] ?? true,
        createdAt: json['createdAt'] == null
            ? DateTime(2023)
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? DateTime(2023)
            : DateTime.parse(json['updatedAt']),
        addedBy: json['addedBy'] ?? "",
        updatedBy: json['updatedBy'] ?? "",
        exam: examss);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> answers =
        this.answers!.map((answer) => answer.toJson()).toList();

    return {
      'id': id,
      // 'userId': userId,
      'exam': examId,
      'answers': answers,
      // 'isDeleted': isDeleted,
      // 'isActive': isActive,
      // 'createdAt': createdAt!.toIso8601String(),
      // 'updatedAt': updatedAt!.toIso8601String(),
      // 'addedBy': addedBy,
      // 'updatedBy': updatedBy,
    };
  }
}

class Answer {
  int number;
  int type;
  String answer;
  String correctAnswer;
  Answer({
    required this.number,
    required this.type,
    required this.answer,
    required this.correctAnswer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      number: json['number'],
      type: json['type'],
      answer: json['answer'],
      correctAnswer: json['correct_answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'number': number,
      'answer': answer,
      'correct_answer': correctAnswer,
    };
  }
}

class Score {
  int total;
  int correct;
  int incorrect;
  int blank;

  Score({
    this.total = 0,
    this.correct = 0,
    this.blank = 0,
    this.incorrect = 0,
  });
}
