import 'package:http/http.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

import 'controller/test_result_controller.dart';

import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

class TestResultScreen extends GetWidget<TestResultController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.gray10001,
          appBar: CustomAppBar(
              height: getVerticalSize(52),
              backgroundColor: Colors.white,
              leadingWidth: 50,
              leading: Padding(
                  padding: getPadding(all: 8),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  )),
              title: Obx(() => Text(
                    controller.exam.value.name,
                    style: TextStyle(color: Colors.black),
                  )),
              actions: [
                Padding(
                  padding: getPadding(right: 8),
                  child: TextButton(
                    child: Text("retest",
                        style: AppStyle.txtRubikMedium14BlueA400.copyWith(
                          fontSize: getFontSize(
                            20,
                          ),
                        )),
                    onPressed: () {},
                  ),
                )
              ]),
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
                                    Text(" incomplete",
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
                child: Padding(
                  padding: getPadding(all: 28),
                  child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Obx(
                        () => ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children:
                                buildAnswers(controller.answersData.value)),
                      )),
                ),
              )
            ],
          )),
    );
  }

  List<Widget> buildAnswers(Map<int, List<Answer>> answerData) {
    List<Widget> data = [];
    answerData.forEach((key, value) {
      if (value.length > 0) {
        data.add(Text("lbl_toeic_part_${key + 1}".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsBold14Indigo900
                .copyWith(letterSpacing: getHorizontalSize(0.5))));
        data.add(AnswersWidget(
          type: key,
          answers: value,
          result: true,
        ));
      }
    });

    return data;
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
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
