import 'package:flutter/material.dart';

class myTextsInfo {
  String text;
  double left;
  double top;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;

  myTextsInfo({
    required this.left,
    required this.fontWeight,
    required this.color,
    required this.fontSize,
    required this.fontStyle,
    required this.text,
    required this.textAlign,
    required this.top,
  });
}
