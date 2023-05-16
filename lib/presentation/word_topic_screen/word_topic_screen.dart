import 'package:toeic_test/presentation/category_screen/widgets/category_widget.dart';
import 'package:toeic_test/presentation/word_category_screen/widgets/category_widget.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'controller/word_topic_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class WordTopicScreen extends GetWidget<WordTopicController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
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
                  "${controller.category.value.name}".tr,
                  style: TextStyle(color: Colors.black),
                )),
            actions: []),
        body: Container(
            width: double.maxFinite,
            child: Obx(() => ListView.builder(
                itemCount: controller.topics.length,
                itemBuilder: (context, index) {
                  final topic = controller.topics[index];

                  return GestureDetector(
                    onTap: () {
                      print("asdasdasd");
                      Get.toNamed(AppRoutes.wordLearningScreen,
                          arguments: topic);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CustomImageView(
                          url: topic.image,
                          width: 100,
                          height: 80,
                        ),
                        title: Text(
                          topic.name,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikMedium18,
                        ),
                        subtitle: Text(
                          "${topic.count} words",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                }))),
      ),
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
