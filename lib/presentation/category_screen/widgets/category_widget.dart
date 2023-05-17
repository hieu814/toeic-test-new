import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';
import 'package:toeic_test/widgets/BlurWidget.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget(
      {required this.thumbnail,
      required this.title,
      required this.subtitle,
      required this.count,
      required this.typeName,
      this.onTap});

  final String thumbnail;
  final String title;
  final String subtitle;

  final String count;
  final String typeName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {
              onTap?.call();
            },
            child: Padding(
              padding: getPadding(all: 4),
              child: SizedBox(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomImageView(
                        url: thumbnail,
                        // fit: BoxFit.fill,
                        width: 150,
                        height: 350,
                        radius: BorderRadius.all(Radius.circular(10))),
                    Expanded(
                      // flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                        child: Column(
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
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 2.0)),
                                  Padding(
                                    padding: getPadding(left: 4),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        subtitle,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text(
                            //   count,
                            //   style: const TextStyle(
                            //     fontSize: 12.0,
                            //     color: Colors.black54,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
