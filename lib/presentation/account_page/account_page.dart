import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/presentation/test_result_screen/widgets/score_widget.dart';

import 'controller/account_controller.dart';
import 'models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore_for_file: must_be_immutable
class AccountPage extends StatelessWidget {
  bool isFetch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray10001,
            appBar: CustomAppBar(
                backgroundColor: Colors.white,
                height: getVerticalSize(66),
                title: AppbarTitle(
                    text: "lbl_account".tr, margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgNotification,
                      margin:
                          getMargin(left: 13, top: 15, right: 13, bottom: 16),
                      onTap: onTapNotification2)
                ]),
            body: SingleChildScrollView(
              child: GetBuilder<AccountController>(
                  init: AccountController(),
                  builder: (controller) {
                    if (!isFetch) {
                      print("hieu get data");
                      controller.getData();
                      isFetch = true;
                    }

                    return Column(
                      children: [
                        Container(
                          margin: getMargin(
                              left: 26, top: 16, right: 26, bottom: 5),
                          padding: getPadding(all: 16),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20),
                          child: Obx(() => ScoreCardWidget(
                                estimatedScore: controller
                                        .toeicScore.value.listeningScore +
                                    controller.toeicScore.value.readingScore,
                                readingScore:
                                    controller.toeicScore.value.readingScore,
                                listeningScore:
                                    controller.toeicScore.value.listeningScore,
                                score: controller
                                        .toeicScore.value.listeningScore +
                                    controller.toeicScore.value.readingScore,
                                total: 990,
                              )),
                        ),
                        Container(
                          margin: getMargin(
                              left: 26, top: 16, right: 26, bottom: 5),
                          padding: getPadding(all: 16),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_toeic_skill".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsBold14Indigo900
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.5))),
                                  ]),
                              Obx(() => SkillChartWidget(
                                    values: [1, 2, 3, 4, 5, 6, 7]
                                        .map((type) =>
                                            controller.toeicScore.value
                                                .percentCorrect[type] ??
                                            0)
                                        .toList(),
                                  )),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: getMargin(
                        //       left: 26, top: 16, right: 26, bottom: 5),
                        //   padding: getPadding(all: 16),
                        //   decoration: AppDecoration.fillWhiteA700.copyWith(
                        //       borderRadius: BorderRadiusStyle.roundedBorder20),
                        //   child: ActivitiesChartWidget(
                        //     type: 1,
                        //     scores: [1, 2, 3, 4, 5, 6, 6],
                        //   ),
                        // ),
                        Container(
                            margin: getMargin(
                                left: 26, top: 16, right: 26, bottom: 5),
                            padding: getPadding(all: 16),
                            decoration: AppDecoration.fillWhiteA700.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder20),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding:
                                                getPadding(top: 9, bottom: 5),
                                            child: Text("lbl_recent_test".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtRubikMedium18)),
                                      ]),
                                  Padding(
                                      padding: getPadding(top: 21, bottom: 6),
                                      child: Obx(() => ListView.separated(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          separatorBuilder: (context, index) {
                                            return Padding(
                                                padding: getPadding(
                                                    top: 14.5, bottom: 14.5),
                                                child: SizedBox(
                                                    width:
                                                        getHorizontalSize(326),
                                                    child: Divider(
                                                        height:
                                                            getVerticalSize(1),
                                                        thickness:
                                                            getVerticalSize(1),
                                                        color: ColorConstant
                                                            .indigo5001)));
                                          },
                                          itemCount: controller.results.length,
                                          itemBuilder: (context, index) {
                                            Result result =
                                                controller.results[index];
                                            Score score = result.getScore();
                                            return ListrectangleItemWidget(
                                              date: formatDate(
                                                  result.updatedAt!.toLocal()),
                                              name: result.exam?.name ?? "",
                                              score:
                                                  "${score.correct}/${score.total}",
                                            );
                                          })))
                                ]))
                      ],
                    );
                  }),
            )));
  }

  onTapUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }

  onTapOrder() {
// TODO: implement Actions
  }
  onTapAddress() {
// TODO: implement Actions
  }
  onTapPayment() {
// TODO: implement Actions
  }
  onTapNotification2() {
// TODO: implement Actions
  }
}

class ActivitiesChartWidget extends StatefulWidget {
  ActivitiesChartWidget({required this.type, required this.scores});

  final Color dark = Colors.cyan.shade200;
  final Color normal = Colors.cyan;
  final Color light = Colors.cyanAccent;
  final int type;
  final List<int> scores;
  @override
  State<StatefulWidget> createState() => ActivitiesChartWidgetState();
}

class ActivitiesChartWidgetState extends State<ActivitiesChartWidget> {
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    if (widget.type == 0) // month
    {
      switch (value.toInt()) {
        case 0:
          text = 'Jan';
          break;
        case 1:
          text = 'Feb';
          break;
        case 2:
          text = 'Mar';
          break;
        case 3:
          text = 'Apr';
          break;
        case 4:
          text = 'May';
          break;
        case 5:
          text = 'Jun';
          break;
        case 6:
          text = 'Jul';
          break;
        case 7:
          text = 'Aug';
          break;
        case 8:
          text = 'Sep';
          break;
        case 9:
          text = 'Oct';
          break;
        case 10:
          text = 'Nov';
          break;
        case 11:
          text = 'Dec';
          break;
        default:
          text = '';
          break;
      }
    } else {
      switch (value.toInt()) {
        case 7:
          text = 'Sun';
          break;
        case 1:
          text = 'Mon';
          break;
        case 2:
          text = 'Tue';
          break;
        case 3:
          text = 'Wed';
          break;
        case 4:
          text = 'Thu';
          break;
        case 5:
          text = 'Fri';
          break;
        case 6:
          text = 'Sat';
          break;
        default:
          text = '';
          break;
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = constraints.maxWidth / 12;
            final barsWidth = 8.0 * constraints.maxWidth / 400;
            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                  touchCallback: (FlTouchEvent event, barTouchResponse) {
                    if (!event.isInterestedForInteractions ||
                        barTouchResponse == null ||
                        barTouchResponse.spot == null) {
                      return;
                    }
                    if ("${event.runtimeType}" != "FlTapUpEvent") {
                      return;
                    }
                    print(
                        "barTouchResponse ${barTouchResponse} asddsaadsdsa : index: ${barTouchResponse!.spot!.touchedBarGroupIndex} event : ${event.runtimeType}");
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.1,
                  ),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: barsSpace,
                barGroups: getData(barsWidth, barsSpace, 450, widget.scores),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(
      double barsWidth, double barsSpace, double maxValue, List<int> values) {
    return values
        .map((val) => BarChartGroupData(
              x: values.indexOf(val) + 1,
              barsSpace: barsSpace,
              barRods: [
                BarChartRodData(
                  toY: val.toDouble(),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    // toY: maxValue,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: const BorderSide(color: Colors.white, width: 0),
                  width: barsWidth,
                )
              ],
            ))
        .toList();
  }
}
// rada

class SkillChartWidget extends StatefulWidget {
  final List<double> values;
  const SkillChartWidget({Key? key, required this.values}) : super(key: key);

  final gridColor = Colors.purple;
  final titleColor = Colors.black;
  final radaColor = Colors.greenAccent;

  @override
  State<SkillChartWidget> createState() => _SkillChartWidgetState();
}

class _SkillChartWidgetState extends State<SkillChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: RadarChart(
              RadarChartData(
                dataSets: showingDataSets(widget.values),
                radarBackgroundColor: Colors.transparent,
                borderData: FlBorderData(show: true),
                radarBorderData: const BorderSide(color: Colors.greenAccent),
                radarShape: RadarShape.polygon,
                titlePositionPercentageOffset: 0.2,
                titleTextStyle:
                    TextStyle(color: widget.titleColor, fontSize: 14),
                getTitle: (index, angle) {
                  final usedAngle = 0.0;
                  switch (index) {
                    case 0:
                      return RadarChartTitle(
                        text: 'lbl_toeic_part_type_2'.tr,
                        angle: usedAngle,
                      );
                    case 1:
                      return RadarChartTitle(
                          text: 'lbl_toeic_part_type_3'.tr, angle: usedAngle);
                    case 2:
                      return RadarChartTitle(
                        text: 'lbl_toeic_part_type_4'.tr,
                        angle: usedAngle,
                      );
                    case 3:
                      return RadarChartTitle(
                        text: 'lbl_toeic_part_type_5'.tr,
                        angle: usedAngle,
                      );
                    case 4:
                      return RadarChartTitle(
                          text: 'lbl_toeic_part_type_6'.tr, angle: usedAngle);
                    case 5:
                      return RadarChartTitle(
                        text: 'lbl_toeic_part_type_7'.tr,
                        angle: usedAngle,
                      );
                    case 6:
                      return RadarChartTitle(
                        text: 'lbl_toeic_part_type_8'.tr,
                        angle: usedAngle,
                      );
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                tickCount: 4,
                ticksTextStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                tickBorderData:
                    const BorderSide(color: Colors.greenAccent, width: 0.1),
                gridBorderData: BorderSide(color: widget.gridColor, width: 0.1),
              ),
              swapAnimationDuration: const Duration(milliseconds: 400),
            ),
          ),
        ],
      ),
    );
  }

  List<RadarDataSet> showingDataSets(List<double> values) {
    return [
      RadarDataSet(
        fillColor: widget.radaColor.withOpacity(0.25),
        borderColor: Colors.green,
        entryRadius: 2,
        dataEntries: values.map((val) => RadarEntry(value: val)).toList(),
        borderWidth: 1,
      ),
      // max values
      RadarDataSet(
        fillColor: Colors.transparent,
        borderColor: Colors.transparent,
        dataEntries: values.map((val) => RadarEntry(value: 1.0)).toList(),
      )
    ];
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: widget.radaColor,
        values: [0.1, 0.50, 0.25, 0.12, 0.60, 0.12, 0.60],
      ),
    ];
  }
}

class ListrectangleItemWidget extends StatelessWidget {
  ListrectangleItemWidget(
      {required this.name, required this.score, required this.date});
  final String name;
  final String score;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: getSize(
            16,
          ),
          width: getSize(
            16,
          ),
          margin: getMargin(
            top: 2,
          ),
          decoration: BoxDecoration(
            color: ColorConstant.blueA400,
            borderRadius: BorderRadius.circular(
              getHorizontalSize(
                4,
              ),
            ),
          ),
        ),
        Padding(
            padding: getPadding(
              left: 16,
              top: 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyle.txtRubikRegular14
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                Text(
                  date,
                  style: AppStyle.txtRubikRegular14.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.23,
                    ),
                  ),
                ),
              ],
            )

            // Text(
            //   date,
            //   overflow: TextOverflow.ellipsis,
            //   textAlign: TextAlign.left,
            //   style: AppStyle.txtRubikRegular14.copyWith(
            //     letterSpacing: getHorizontalSize(
            //       0.23,
            //     ),
            //   ),
            // ),
            ),
        Spacer(),
        Text(
          score,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtRubikMedium16.copyWith(
            letterSpacing: getHorizontalSize(
              0.2,
            ),
          ),
        ),
      ],
    );
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
