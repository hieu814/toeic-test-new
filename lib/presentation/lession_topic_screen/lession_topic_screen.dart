import 'package:toeic_test/presentation/lession_topic_screen/controller/lession_topic_controller.dart';

import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class LessionTopicScreen extends GetWidget<LessionTopicController> {
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
                itemCount: controller.lessions.length,
                itemBuilder: (context, index) {
                  final lession = controller.lessions[index];

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.lessionScreen, arguments: lession);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CustomImageView(
                          url: lession.thumbail,
                          width: 100,
                          height: 80,
                        ),
                        title: Text(
                          lession.name,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikMedium18,
                        ),
                        subtitle: Text(
                          "${lession.description} words",
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
