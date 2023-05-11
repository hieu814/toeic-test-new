import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/presentation/exam_test_screen/controller/exam_test_controller.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/passage_widget.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/question_wiget.dart';

class GroupQuestionWidget extends GetWidget<TestController> {
  const GroupQuestionWidget({Key? key, required this.groupQuestion})
      : super(key: key);
  final GroupQuestionModel groupQuestion;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (groupQuestion.type < 5 && groupQuestion.image != null)
            CustomImageView(
              url: groupQuestion.image,
            ),
          if (groupQuestion.type > 5)
            PassageWidget(
              text: groupQuestion.passage,
            ),
          Center(
            child: Column(
                children: (groupQuestion.questions
                    .map((question) => Obx(() => QuestionWidget(
                          key: UniqueKey(),
                          isFinish: controller.isSubmited.value,
                          type: groupQuestion.type,
                          selectedQuestion:
                              controller.answers.value[question.number] ?? "",
                          question: question,
                          onSelect: (question, answer) => {
                            controller.selectAnswer(
                                groupQuestion.type, question, answer)
                          },
                        )))
                    .toList())),
          )
        ],
      ),
    );
  }
}
