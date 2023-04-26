import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000c,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              -5,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBlueA400 => BoxDecoration(
        color: ColorConstant.blueA400,
      );
  static BoxDecoration get outlineBlue501 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blue50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineGreen700 => BoxDecoration(
        color: ColorConstant.green700,
        border: Border.all(
          color: ColorConstant.blue50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );
  static BoxDecoration get outlineBlue50 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blue50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );

  static BoxDecoration get fillLightblueA200 => BoxDecoration(
        color: ColorConstant.lightBlueA200,
      );
  static BoxDecoration get txtFillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );

  static BorderRadius circleBorder36 = BorderRadius.circular(
    getHorizontalSize(
      36,
    ),
  );

  static BorderRadius txtRoundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius customBorderTL33 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        33,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        33,
      ),
    ),
  );

  static BorderRadius customBorderBL40 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        40,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        40,
      ),
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius circleBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
