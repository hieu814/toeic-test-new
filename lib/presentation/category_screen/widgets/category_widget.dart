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
      required this.author,
      required this.count,
      required this.typeName,
      this.onTap});

  final String thumbnail;
  final String title;
  final String subtitle;
  final String author;
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
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: BlurWidget(
                background: CustomImageView(url: thumbnail, fit: BoxFit.fill),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: AppStyle.txtRobotoRegular20
                              .copyWith(fontSize: 20, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(subtitle,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          maxLines: 6,
                          style: AppStyle.txtRobotoRegular20.copyWith(
                              fontSize: 15, color: Colors.grey.shade200)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
