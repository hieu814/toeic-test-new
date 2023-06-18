import 'package:flutter/material.dart';

import 'package:toeic_test/core/app_export.dart';

import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/audio_play.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/group_question_widget.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/passage_widget.dart';

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
                      children:
                          controller.answersData.value.entries.map((entry) {
                        final key = entry.key;
                        final value = entry.value;

                        if (value.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_toeic_part_type_${key + 1}".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsBold14Indigo900
                                    .copyWith(
                                        letterSpacing: getHorizontalSize(0.5)),
                              ),
                              AnswersWidget(
                                answers: value,
                                result: true,
                              ),
                            ],
                          );
                        } else {
                          return Container(); // Return an empty container if the value is empty
                        }
                      }).toList()),
                )),
          ),
        ),
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
                              ? "lbl_toeic_part_type_${controller.currentQuesttion.value.type + 1}"
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
                    if (controller.result.value.getScore().blank > 0) {
                      bool? result = await showConfirmationDialog(context);
                      if (result == null || !result) {
                        return;
                      }
                    }
                    await controller.submit().then((value) async {
                      if (controller.result.value.getScore().blank > 0) {
                      } else {
                        await controller.submit().then((value) {
                          controller.exam.value.result =
                              controller.result.value;
                          Get.offNamed(AppRoutes.examTestResultScreen,
                              arguments: controller.exam.value);
                        });
                      }
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
              Expanded(child: Container(
                child: Obx(() {
                  _scaffoldKey.currentState!.closeEndDrawer();
                  return GroupQuestionWidget(
                    key: UniqueKey(),
                    isTip: controller.isTip.value,
                    groupQuestion: controller.currentQuesttion.value,
                  );
                }),
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
                                      fontSize: 15,
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
                          onPressed: () {
                            if (controller.currentQuesttion.value.type <= 2 &&
                                !controller.isFirstTest.value) {
                              controller.isTip.value = true;
                            }
                            if (controller
                                .currentQuesttion.value.transcript.isNotEmpty)
                              showDraggableModalBottomSheet(
                                  context,
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("lbl_transcripts".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsBold16
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.5))),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Container(
                                              decoration: AppDecoration
                                                  .fillWhiteA700
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10,
                                              ),
                                              // color: Colors.white,
                                              child: SingleChildScrollView(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                child: PassageWidget(
                                                    text: controller
                                                        .currentQuesttion
                                                        .value
                                                        .transcript),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            controller.onNext();
                          },
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
      data.add(Text("lbl_toeic_part_type_${key + 1}".tr,
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

void showDraggableModalBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // expand: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1,
        minChildSize: 0.25,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: ColorConstant.gray10001,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              // physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: getPadding(bottom: 7),
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorConstant.black900,
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Future<bool?> showConfirmationDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text(
            'You should complete the test in order to calculate the skills.\n Continue?'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context)
                  .pop(false); // Return false if "No" is selected
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // Return true if "Yes" is selected
            },
          ),
        ],
      );
    },
  );
}
