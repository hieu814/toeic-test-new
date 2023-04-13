import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:toeic_test/core/utils/color_constant.dart';

class ExamItemWidget extends StatelessWidget {
  ExamItemWidget(
      {required this.thumbnail,
      required this.title,
      required this.subtitle,
      required this.author,
      required this.publishDate,
      required this.readDuration,
      this.onTap});

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;
  Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstant.whiteA700,
                ColorConstant.whiteA7002,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Card(
            color: Colors.transparent, // Set the card color to transparent
            elevation: 0, // Remove the card's elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: thumbnail,
                        ),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: _ArticleDescription(
                        title: title,
                        subtitle: subtitle,
                        author: author,
                        publishDate: publishDate,
                        readDuration: readDuration,
                      ),
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

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 4.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 12.0,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    publishDate,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    Icons.access_time,
                    size: 12.0,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    readDuration,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                author,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4.0),
            ],
          ),
        ),
      ],
    );
  }
}
