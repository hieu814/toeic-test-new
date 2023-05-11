import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/data/models/exam/result.dart';

class ExamModel {
  final String name;
  final String id;
  final int type;
  final String image;
  final String description;
  final List<GroupQuestionModel> questions;
  bool retest = false;
  Result? result = null;
  ExamModel(
      {this.id = "",
      this.name = "",
      this.type = 0,
      this.image = "",
      this.description = "",
      this.questions = const [],
      this.result});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    List<GroupQuestionModel> groupQuestions = [];
    List<dynamic> questionList = json['questions'] as List;
    if (questionList.length > 0 && !(questionList[0] is String)) {
      groupQuestions = questionList
          .map((question) => GroupQuestionModel.fromJson(question))
          .toList();
      groupQuestions.removeWhere((question) => question.questions.length == 0);
      groupQuestions.sort(
          (a, b) => a.minQuestion().number.compareTo(b.minQuestion().number));
    } else {
      groupQuestions =
          questionList.map((question) => GroupQuestionModel()).toList();
    }

    // for (var question in groupQuestions) {
    //   print('Question ${question.group}');
    // }

    return ExamModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      type: json['type'] ?? 0,
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      questions: groupQuestions,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['description'] = this.description;
    data['questions'] =
        this.questions.map((question) => question.toJson()).toList();
    return data;
  }
}
