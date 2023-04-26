import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/audio_play.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/group_question_widget.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/question_wiget.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';
import 'controller/exam_test_controller.dart';

class ExamTestScreen extends GetWidget<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller.submit();
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
                          onPressed: () => {print("Click next")},
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
