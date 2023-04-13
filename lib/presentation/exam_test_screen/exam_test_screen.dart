import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/exam_test_screen/widgets/audio_play.dart';
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
                    // Get.toNamed(RouteName.testScreen);
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
              Expanded(child: Container()),
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
                          onPressed: () => {print("Click next")},
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

class TopBar extends StatelessWidget {
  const TopBar(
      {Key? key, required this.text, required this.time, this.onPressed})
      : super(key: key);
  final String text;
  final String time;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      // color: kColorFimary,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () async {
              // Get.toNamed(RouteName.testScreen);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: const Size(100, 70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                // color: invert(HexColor(color ?? "#FFFFFF"))
              ),
            ),
          ),
        ),
        Expanded(
            child: Center(
          child: Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              // color: invert(HexColor(color ?? "#FFFFFF"))
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () async {
              // Get.toNamed(RouteName.testScreen);
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
        ),
      ]),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    this.onNext,
    this.onBack,
  }) : super(key: key);

  final void Function()? onNext;
  final void Function()? onBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ElevatedButton(
                // style: raisedButtonStyle,
                onPressed: onBack,
                child: const Text('Back'),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                // style: raisedButtonStyle,
                onPressed: onNext,
                child: const Text('Next'),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        )
      ]),
    );
  }
}
