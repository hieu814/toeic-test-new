import 'package:percent_indicator/percent_indicator.dart';
import 'package:toeic_test/data/models/exam/result.dart';

import 'controller/test_result_controller.dart';

import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

class TestResultScreen extends GetWidget<TestResultController> {
  @override
  Widget build(BuildContext context) {
    List<Answer> dataEst = [];
    for (var i = 0; i < 20; i++) {
      dataEst.add(Answer(
          answer: "A", correctAnswer: i % 2 == 0 ? "A" : "B", number: i));
    }
    List<Answer> dataEst2 = [];
    for (var i = 0; i < 20; i++) {
      dataEst2.add(Answer(
          answer: i % 2 == 0 ? "A" : "",
          correctAnswer: i % 2 == 0 ? "A" : "B",
          number: i));
    }
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.gray10001,
          appBar: AppBar(
            title: Text("ss"),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: getMargin(
                    top: 5,
                    left: 26,
                    right: 26,
                  ),
                  padding: getPadding(
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Obx(() => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircularPercentIndicator(
                            animationDuration: 1000,
                            radius: 40.0,
                            lineWidth: 10.0,
                            percent: (controller.score.value.correct /
                                    controller.score.value.total)
                                .toDouble(),
                            center: new Text(
                                "${controller.score.value.correct}/${controller.score.value.total}",
                                style: AppStyle.txtRubikMedium18),
                            progressColor: Colors.green,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 18,
                            ),
                            child: Divider(
                              height: getVerticalSize(
                                1,
                              ),
                              thickness: getVerticalSize(
                                1,
                              ),
                              color: ColorConstant.indigo50,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 16,
                              top: 15,
                              right: 17,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                          left: 6,
                                        ),
                                        child: Card(
                                          color: Colors.green.shade400,
                                          child: Padding(
                                            padding: getPadding(all: 5),
                                            child: Center(
                                              child: Text(
                                                  "${controller.score.value.correct}",
                                                  style: AppStyle
                                                      .txtRubikMedium18
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ),
                                          ),
                                        )),
                                    Text(" correct",
                                        style: AppStyle.txtRubikMedium18
                                            .copyWith(color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                          left: 6,
                                        ),
                                        child: Card(
                                          color: Colors.red.shade400,
                                          child: Padding(
                                            padding: getPadding(all: 5),
                                            child: Center(
                                              child: Text(
                                                  "${controller.score.value.incorrect}",
                                                  style: AppStyle
                                                      .txtRubikMedium18
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ),
                                          ),
                                        )),
                                    Text(" incorrect",
                                        style: AppStyle.txtRubikMedium18
                                            .copyWith(color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                          left: 6,
                                        ),
                                        child: Card(
                                          color: Colors.grey.shade400,
                                          child: Padding(
                                            padding: getPadding(all: 5),
                                            child: Center(
                                              child: Text(
                                                  "${controller.score.value.blank}",
                                                  style: AppStyle
                                                      .txtRubikMedium18
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ),
                                          ),
                                        )),
                                    Text(" blank",
                                        style: AppStyle.txtRubikMedium18
                                            .copyWith(color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: getMargin(
                          top: 20,
                          left: 26,
                          right: 26,
                        ),
                        padding: getPadding(
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Obx(
                          () => AnswersWidget(
                            type: 1,
                            answers: controller.result.value.answers,
                            result: true,
                          ),
                        ))),
              )
            ],
          )),
    );
  }

  onTapProduct() {
    print("tap pp");
    // Get.toNamed(AppRoutes.examTestScreen, arguments: exam);
  }

  onTapArrowleft() {
    Get.back();
  }

  onTapSearch() {
// TODO: implement Actions
  }
}

class AnswerSheetWidget extends StatelessWidget {
  const AnswerSheetWidget(
      {Key? key, required this.answerDatas, required this.result})
      : super(key: key);
  final Map<int, List<Answer>> answerDatas;
  final bool result;
  List<Widget> buldList() {
    List<Widget> widgetList = [];
    answerDatas.forEach((key, value) {
      widgetList.add(AnswersWidget(
        type: key,
        answers: value,
        result: result,
      ));
    });
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: buldList());
  }
}

class AnswersWidget extends StatelessWidget {
  const AnswersWidget(
      {Key? key,
      required this.answers,
      required this.type,
      required this.result})
      : super(key: key);
  final List<Answer> answers;
  final bool result;
  final int type;
  Color getColor(Answer data) {
    if (!result) return Colors.blueAccent.shade400;
    Color color = Colors.grey.shade400;
    if (['A', 'B', 'C', 'D'].contains(data.answer)) {
      color = data.answer == data.correctAnswer
          ? Colors.green.shade400
          : Colors.red.shade400;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: (1 / .4)),
        itemCount: answers.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: getColor(answers[index]),
            child: Center(
              child: Text(
                  "${answers[index].number}${[
                    'A',
                    'B',
                    'C',
                    'D'
                  ].contains(answers[index].answer) ? "-${answers[index].answer}" : ""}",
                  style: AppStyle.txtRubikMedium14.copyWith(
                      color: !result
                          ? Colors.white
                          : ['A', 'B', 'C', 'D'].contains(answers[index].answer)
                              ? Colors.white
                              : Colors.black)),
            ),
          );
        });
  }
}
