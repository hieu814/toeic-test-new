import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  final Widget? background;
  final Widget? nonBlurBackground;
  final Widget child;
  BlurWidget({required this.child, this.background, this.nonBlurBackground});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: background,
          ),
        ),
        if (nonBlurBackground != null)
          Positioned.fill(child: nonBlurBackground ?? Container()),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
