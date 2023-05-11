import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toeic_test/core/app_export.dart';

class ScoreCardWidget extends StatelessWidget {
  final int? estimatedScore;
  final int? listeningScore;
  final int? readingScore;
  final int? score;
  final int? total;
  final DateTime? dateTime;

  ScoreCardWidget({
    this.estimatedScore,
    this.listeningScore,
    this.readingScore,
    this.score,
    this.total = 1,
    this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (score != null)
              Expanded(
                child: Padding(
                  padding: getPadding(left: 10, right: 10),
                  child: CircularPercentIndicator(
                    animationDuration: 1000,
                    radius: 40.0,
                    lineWidth: 10.0,
                    percent: ((score ?? 0) / (total ?? 1)).toDouble(),
                    center: new Text("$score/$total",
                        style: AppStyle.txtRubikMedium18),
                    progressColor: Colors.green,
                  ),
                ),
              ),
            if (estimatedScore != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.assessment, color: Colors.green),
                      SizedBox(width: 8.0),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: 'Estimated Score: ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: '$estimatedScore',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.hearing, color: Colors.green),
                      SizedBox(width: 8.0),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: 'Listening Score: ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: '$listeningScore',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.book, color: Colors.green),
                      SizedBox(width: 8.0),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: 'Reading Score: ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: '$readingScore',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
