import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PassageWidget extends StatefulWidget {
  final String text;
  const PassageWidget({Key? key, required this.text}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<PassageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: HtmlWidget(
        widget.text,
        customWidgetBuilder: (element) {
          if (element.localName == 'img') {
            final src = element.attributes['src'];
            final alt = element.attributes['alt'] ?? '';

            return Image.network(
              "https://i.stack.imgur.com/5zdJz.jpg",
              semanticLabel: alt,
              width: 100,
              height: 100,
            );
          }

          return null;
        },
      ),
    );
  }
}
