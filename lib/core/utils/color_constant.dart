import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray300 = fromHex('#9098b1');

  static Color lightBlueA200 = fromHex('#40bfff');

  static Color indigoA200 = fromHex('#5b61f4');

  static Color lightBlueA2003d = fromHex('#3d40bfff');

  static Color blue50 = fromHex('#eaefff');

  static Color indigo90087 = fromHex('#87223263');

  static Color whiteA70087 = fromHex('#87ffffff');

  static Color lightBlueA20019 = fromHex('#1940bfff');

  static Color black900 = fromHex('#000000');

  static Color yellow700 = fromHex('#ffc732');

  static Color bluegray400 = fromHex('#888888');

  static Color indigo900 = fromHex('#223263');
  static Color pink300 = fromHex('#fb7181');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA7002 = fromHex('#ede8e8');
  static Color blueA400 = fromHex('#1f87fe');

  static Color blueGray10000 = fromHex('#00d7d7d7');

  static Color indigo50 = fromHex('#e9eef8');

  static Color blueGray600 = fromHex('#4c5980');

  static Color black9000c01 = fromHex('#0c090b0f');

  static Color black9000c = fromHex('#0c000000');

  static Color green700 = fromHex('#219653');

  static Color blueGray9006c = fromHex('#6c2d3142');

  static Color gray100 = fromHex('#f4f6fa');

  static Color gray10001 = fromHex('#f0f3fa');

  static Color indigo5001 = fromHex('#ebf0fa');

  static Color blueGray900 = fromHex('#2d3142');

  static Color blueA4006c = fromHex('#6c1f87fe');

// #424242

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
