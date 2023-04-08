import 'package:toeic_test/data/models/exam/group_question.dart';

class ExamModel {
  final String name;
  final int type;
  final String image;
  final String description;
  final List<GroupQuestionModel> questions;

  ExamModel({
    required this.name,
    required this.type,
    required this.image,
    required this.description,
    required this.questions,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    List<GroupQuestionModel> groupQuestions = [];
    List<dynamic> questionList = json['questions'] as List;
    if (questionList.length > 0 && !(questionList[0] is String)) {
      groupQuestions = questionList
          .map((question) => GroupQuestionModel.fromJson(question))
          .toList();
    }
    return ExamModel(
      name: json['name'] ?? "",
      type: json['type'] ?? 0,
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      questions: groupQuestions,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['description'] = this.description;
    data['questions'] =
        this.questions.map((question) => question.toJson()).toList();
    return data;
  }
}
