// import 'controller/iphone_11_pro_max_one_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:hieu_s_application11/core/app_export.dart';
// import 'package:hieu_s_application11/widgets/custom_button.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class Iphone11ProMaxOneScreen extends GetWidget<Iphone11ProMaxOneController> {
//   @override
//   Widget build(BuildContext context) {
//     List<AnswerData> dataEst = [];
//     for (var i = 0; i < 20; i++) {
//       dataEst.add(AnswerData(
//           answer: "A", correctAnswer: i % 2 == 0 ? "A" : "B", number: i));
//     }
//     List<AnswerData> dataEst2 = [];
//     for (var i = 0; i < 20; i++) {
//       dataEst2.add(AnswerData(
//           answer: i % 2 == 0 ? "A" : "",
//           correctAnswer: i % 2 == 0 ? "A" : "B",
//           number: i));
//     }
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConstant.gray100,
//        endDrawer: Drawer(child: AnswerSheetWidget(
//                           result: false,
//                           answerDatas: {1: dataEst, 2: dataEst2})),
//         body: Container(
//           width: double.maxFinite,
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: getVerticalSize(
//                   223,
//                 ),
//                 width: double.maxFinite,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Container(
//                         width: double.maxFinite,
//                         margin: getMargin(
//                           bottom: 60,
//                         ),
//                         padding: getPadding(
//                           left: 26,
//                           top: 24,
//                           right: 26,
//                           bottom: 24,
//                         ),
//                         decoration: AppDecoration.fillBlueA400.copyWith(
//                           borderRadius: BorderRadiusStyle.customBorderBL40,
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomImageView(
//                               svgPath: ImageConstant.imgMenu,
//                               height: getVerticalSize(
//                                 28,
//                               ),
//                               width: getHorizontalSize(
//                                 24,
//                               ),
//                               margin: getMargin(
//                                 bottom: 85,
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 left: 101,
//                                 bottom: 85,
//                               ),
//                               child: Text(
//                                 "lbl_dashbord".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppStyle.txtRubikMedium24,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         margin: getMargin(
//                           left: 26,
//                           right: 26,
//                         ),
//                         padding: getPadding(
//                           top: 16,
//                           bottom: 16,
//                         ),
//                         decoration: AppDecoration.fillWhiteA700.copyWith(
//                           borderRadius: BorderRadiusStyle.roundedBorder10,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: getPadding(
//                                 top: 7,
//                               ),
//                               child: Text(
//                                 "lbl_today".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppStyle.txtRubikMedium18.copyWith(
//                                   letterSpacing: getHorizontalSize(
//                                     0.2,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 top: 1,
//                               ),
//                               child: Text(
//                                 "asasdadsdasasd".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppStyle.txtRubikBold24.copyWith(
//                                   letterSpacing: getHorizontalSize(
//                                     0.2,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 top: 18,
//                               ),
//                               child: Divider(
//                                 height: getVerticalSize(
//                                   1,
//                                 ),
//                                 thickness: getVerticalSize(
//                                   1,
//                                 ),
//                                 color: ColorConstant.indigo50,
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 left: 16,
//                                 top: 15,
//                                 right: 17,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                       padding: getPadding(
//                                         left: 6,
//                                       ),
//                                       child: Card(
//                                         color: Colors.greenAccent.shade100,
//                                         child: Center(
//                                           child: Padding(
//                                             padding: getPadding(
//                                               all: 8,
//                                             ),
//                                             child: Text("1",
//                                                 style: AppStyle.txtRubikMedium18
//                                                     .copyWith(
//                                                         color: Colors.white)),
//                                           ),
//                                         ),
//                                       )),
//                                   Text(" correct",
//                                       style: AppStyle.txtRubikMedium18
//                                           .copyWith(color: Colors.black)),
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Padding(
//                                       padding: getPadding(
//                                         left: 6,
//                                       ),
//                                       child: Card(
//                                         color: Colors.redAccent.shade100,
//                                         child: Center(
//                                           child: Padding(
//                                             padding: getPadding(
//                                               all: 8,
//                                             ),
//                                             child: Text("2",
//                                                 style: AppStyle.txtRubikMedium18
//                                                     .copyWith(
//                                                         color: Colors.white)),
//                                           ),
//                                         ),
//                                       )),
//                                   Text(" incorrect",
//                                       style: AppStyle.txtRubikMedium18
//                                           .copyWith(color: Colors.black)),
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Padding(
//                                       padding: getPadding(
//                                         left: 6,
//                                       ),
//                                       child: Card(
//                                         color: Colors.grey.shade100,
//                                         child: Center(
//                                           child: Padding(
//                                             padding: getPadding(
//                                               all: 8,
//                                             ),
//                                             child: Text("2",
//                                                 style: AppStyle.txtRubikMedium18
//                                                     .copyWith(
//                                                         color: Colors.black)),
//                                           ),
//                                         ),
//                                       )),
//                                   Text(" blank",
//                                       style: AppStyle.txtRubikMedium18
//                                           .copyWith(color: Colors.black)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                     margin: getMargin(
//                       left: 26,
//                       top: 16,
//                       right: 26,
//                     ),
//                     padding: getPadding(
//                       top: 15,
//                       bottom: 15,
//                     ),
//                     height: 100,
//                     // constraints: BoxConstraints.expand(),
//                     decoration: AppDecoration.fillWhiteA700.copyWith(
//                       borderRadius: BorderRadiusStyle.roundedBorder10,
//                     ),
//                     child: Padding(
//                       padding: getPadding(
//                         all: 16,
//                       ),
//                       child: AnswerSheetWidget(
//                           result: false,
//                           answerDatas: {1: dataEst, 2: dataEst2}),
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AnswerSheetWidget extends StatelessWidget {
//   const AnswerSheetWidget(
//       {Key? key, required this.answerDatas, required this.result})
//       : super(key: key);
//   final Map<int, List<AnswerData>> answerDatas;
//   final bool result;
//   List<Widget> buldList() {
//     List<Widget> widgetList = [];
//     answerDatas.forEach((key, value) {
//       widgetList.add(Expanded(
//           child: AnswersWidget(
//         type: key,
//         answers: value,
//         result: result,
//       )));
//     });
//     return widgetList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: buldList());
//   }
// }

// class AnswersWidget extends StatelessWidget {
//   const AnswersWidget(
//       {Key? key,
//       required this.answers,
//       required this.type,
//       required this.result})
//       : super(key: key);
//   final List<AnswerData> answers;
//   final bool result;
//   final int type;
//   Color getColor(AnswerData data) {
//     if (!result) return Colors.blueAccent.shade100;
//     Color color = Colors.grey.shade100;
//     if (['A', 'B', 'C', 'D'].contains(data.answer)) {
//       color = data.answer == data.correctAnswer
//           ? Colors.greenAccent.shade100
//           : Colors.redAccent.shade100;
//     }
//     return color;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: getPadding(
//             left: 12,
//             bottom: 1,
//           ),
//           child: Text(
//             "lbl_dashbord".tr,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.left,
//             style: AppStyle.txtRubikMedium24.copyWith(color: Colors.black),
//           ),
//         ),
//         SizedBox(width: 26),
//         Expanded(
//           child: Padding(
//             padding: getPadding(
//               left: 12,
//               bottom: 1,
//             ),
//             child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4, childAspectRatio: (1 / .4)),
//                 itemCount: answers.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     color: getColor(answers[index]),
//                     child: Center(
//                       child: Text(
//                           "${answers[index].number}${[
//                             'A',
//                             'B',
//                             'C',
//                             'D'
//                           ].contains(answers[index].answer) ? "-${answers[index].answer}" : ""}",
//                           style: AppStyle.txtRubikMedium14.copyWith(
//                               color: !result
//                                   ? Colors.white
//                                   : ['A', 'B', 'C', 'D']
//                                           .contains(answers[index].answer)
//                                       ? Colors.white
//                                       : Colors.black)),
//                     ),
//                   );
//                 }),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class AnswerData {
//   AnswerData(
//       {required this.number,
//       required this.answer,
//       required this.correctAnswer});
//   final int number;
//   final String answer;
//   final String correctAnswer;
// }
