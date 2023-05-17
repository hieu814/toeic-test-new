import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toeic_test/presentation/word_learning_screen/widgets/word_widget.dart';
import 'package:toeic_test/presentation/word_topic_screen/models/topic_model.dart';

import 'controller/word_learning_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class WordLearningScreen extends GetWidget<WordLearningController> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "${controller.topic.value.name}".tr,
                  style: TextStyle(color: Colors.black),
                )),
            actions: []),
        body: Obx(() => Column(
              children: [
                Padding(
                  padding: getPadding(top: 20, left: 10, right: 10),
                  child: LinearPercentIndicator(
                    percent: controller.topic.value.words.length == 0
                        ? 0
                        : controller.index.value /
                            controller.topic.value.words.length,
                    lineHeight: 10,
                    barRadius: Radius.circular(5),
                  ),
                ),
                if (controller.topic.value.words.length > 0)
                  Expanded(
                    child: CarouselSlider.builder(
                      carouselController: _controller,
                      itemCount: controller.topic.value.words.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final WordModel word =
                            controller.topic.value.words[index];
                        return FlipWordWidget(
                          word: word,
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          controller.index.value = index;
                        },
                        aspectRatio: 10 / 11,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                Padding(
                  padding: getPadding(all: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            _controller.previousPage();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            _controller.nextPage();
                          },
                          icon: Icon(Icons.arrow_forward_ios,
                              color: Colors.black))
                    ],
                  ),
                )
              ],
            )));
  }
}
