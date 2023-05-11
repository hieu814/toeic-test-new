import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/audio_play.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/group_question_widget.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/question_wiget.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';
import 'controller/exam_test_controller.dart';

class ExamTestScreen extends GetWidget<TestController> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: Padding(
            padding: getPadding(top: 28),
            child: Obx(() => SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: buildAnswers(controller.answersData.value)),
                )),
          ),
        ),
        appBar: CustomAppBar(
            height: getVerticalSize(52),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, bottom: 2),
                onTap: () {
                  Get.back();
                }),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Obx(() => Text(
                          controller.currentQuesttion.value.type > 0 &&
                                  controller.currentQuesttion.value.type < 8
                              ? "lbl_toeic_part_${controller.currentQuesttion.value.type}"
                                  .tr
                              : "",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  child: Obx(() => Text(
                        controller.time.value,
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.submit().then((value) {
                      Result sdsd = controller.exam.value.result ?? Result();

                      Get.offNamed(AppRoutes.examTestResultScreen,
                          arguments: controller.exam.value);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      // color: invert(HexColor(color ?? "#FFFFFF"))
                    ),
                  ),
                ),
              )
            ]),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Obx(() => GroupQuestionWidget(
                      key: UniqueKey(),
                      groupQuestion: controller.currentQuesttion.value,
                    )),
              )),
              Card(
                child: Column(
                  children: [
                    Obx(() => controller.currentQuesttion.value.type < 5
                        ? AudioPlayerWidget(
                            key: UniqueKey(),
                            autoPlay: true,
                            audioUrl: controller.currentQuesttion.value.audio)
                        : Container()),
                    Obx(() => controller.currentQuesttion.value.type > 5
                        ? AudioPlayerWidget(
                            key: UniqueKey(),
                            autoPlay: true,
                            audioUrl: controller.currentQuesttion.value.audio)
                        : Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () => {controller.onBack()},
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Obx(() => Text(
                                  "Question ${controller.currentQuesttion.value.group}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.deepOrange
                                      // color: invert(HexColor(color ?? "#FFFFFF"))
                                      ),
                                )),
                          ],
                        )),
                        IconButton(
                          icon: Icon(
                            IconData(0xe37c, fontFamily: 'MaterialIcons'),
                            color: Colors.yellow,
                          ),
                          onPressed: () => {controller.onBack()},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () => {controller.onNext()},
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
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
        answers: value,
        result: true,
      ));
    }
  });

  return data;
}

class AnswersWidget extends GetWidget<TestController> {
  const AnswersWidget({Key? key, required this.answers, required this.result})
      : super(key: key);
  final List<Answer> answers;
  final bool result;
  Color getColor(Answer data) {
    Color color = Colors.grey.shade400;
    if (['A', 'B', 'C', 'D'].contains(data.answer)) {
      color = Colors.blue.shade400;
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
          return GestureDetector(
            onTap: () {
              // print("hieu ontap ${answers[index].number}");
              controller.selectAnswerSheet(answers[index].number);
            },
            child: Card(
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
                            : ['A', 'B', 'C', 'D']
                                    .contains(answers[index].answer)
                                ? Colors.white
                                : Colors.black)),
              ),
            ),
          );
        });
  }
}
