import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivitiesChartWidget extends StatefulWidget {
  ActivitiesChartWidget(this.type, this.scores);

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
  final titleColor = Colors.purpleAccent;
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
                radarBorderData: const BorderSide(color: Colors.grey),
                radarShape: RadarShape.polygon,
                titlePositionPercentageOffset: 0.2,
                titleTextStyle:
                    TextStyle(color: widget.titleColor, fontSize: 14),
                getTitle: (index, angle) {
                  final usedAngle = 0.0;
                  switch (index) {
                    case 0:
                      return RadarChartTitle(
                        text: '1',
                        angle: usedAngle,
                      );
                    case 1:
                      return RadarChartTitle(text: '2', angle: usedAngle);
                    case 2:
                      return RadarChartTitle(
                        text: '3',
                        angle: usedAngle,
                      );
                    case 3:
                      return RadarChartTitle(
                        text: '4',
                        angle: usedAngle,
                      );
                    case 4:
                      return RadarChartTitle(text: '5', angle: usedAngle);
                    case 5:
                      return RadarChartTitle(
                        text: '6',
                        angle: usedAngle,
                      );
                    case 6:
                      return RadarChartTitle(
                        text: '7',
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
                    const BorderSide(color: Colors.grey, width: 0.1),
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
        borderColor: Colors.black38.withOpacity(0.5),
        entryRadius: 5,
        dataEntries: values.map((val) => RadarEntry(value: val)).toList(),
        borderWidth: 3,
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
