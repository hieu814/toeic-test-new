import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'controller/lession_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class LessionScreen extends GetWidget<LessionController> {
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
        body: Obx(() => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomImageView(url: controller.topic.value.thumbail),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      controller.topic.value.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HtmlWidget(controller.topic.value.content),
                  ),
                ],
              ),
            )));
  }
}
