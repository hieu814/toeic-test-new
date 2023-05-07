import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

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

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String count;
  final String typeName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(all: 15),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          height: 120,
          decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
              color: ColorConstant.green700.withOpacity(0.1)),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: getPadding(all: 10),
                    child: thumbnail,
                  ),
                  flex: 5,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: getPadding(all: 5),
                    child: _ArticleDescription(
                      title: title,
                      subtitle: subtitle,
                      author: author,
                      count: count,
                      typeName: typeName,
                    ),
                  ),
                ),
              ],
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
    required this.count,
    required this.typeName,
  });

  final String title;
  final String subtitle;
  final String author;
  final String count;
  final String typeName;

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
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Text(
          '$count - $typeName',
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
