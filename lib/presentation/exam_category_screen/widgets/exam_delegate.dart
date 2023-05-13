import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamDelegate extends StatelessWidget {
  const ExamDelegate(
      {Key? key,
      required this.name,
      required this.type,
      this.lastTestDate,
      this.score,
      this.total,
      this.onTap,
      required this.totalQuestion})
      : super(key: key);
  final String name;
  final String type;
  final int totalQuestion;
  final int? score;
  final int? total;
  final String? lastTestDate;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        all: 5,
      ),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
              color: ColorConstant.gray10001.withOpacity(0.5)),
          child: Card(
            child: Padding(
              padding: getPadding(
                all: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(top: 9, bottom: 9),
                    child: Row(
                      children: [
                        new CircularPercentIndicator(
                          radius: 34.0,
                          lineWidth: 4.0,
                          percent: (score ?? 0) / (total ?? 1),
                          center: new Text(
                              "${total == null ? "0/0" : "${score ?? 0}/${total ?? 0}"}"),
                          progressColor: Colors.green,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(
                                      left: 10,
                                      top: 2,
                                      bottom: 1,
                                    ),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        name,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRubikMedium18,
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 10,
                                        top: 2,
                                        bottom: 1,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: AppDecoration
                                                .outlineGreen700
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder10,
                                                    color: ColorConstant
                                                        .green700
                                                        .withOpacity(0.5)),
                                            child: Padding(
                                              padding: getPadding(all: 3),
                                              child: Text(
                                                type,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtRubikMedium14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Total question: ",
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .blueGray900,
                                                    fontSize: getFontSize(
                                                      12,
                                                    ),
                                                    fontFamily:
                                                        'Font Awesome 5 Free',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "$totalQuestion",
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .blueGray900,
                                                    fontSize: getFontSize(
                                                      12,
                                                    ),
                                                    fontFamily: 'Rubik',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          if (lastTestDate != null)
                                            Text(
                                              "Last test: $lastTestDate",
                                              style: TextStyle(
                                                color:
                                                    ColorConstant.blueGray900,
                                                fontSize: getFontSize(
                                                  12,
                                                ),
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
