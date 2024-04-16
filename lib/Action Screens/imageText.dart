import 'package:flutter/material.dart';
import 'package:image_editings/Constants/myTextsInfo.dart';

class imageText extends StatelessWidget {
  final myTextsInfo textsInfo;
  const imageText({super.key, required this.textsInfo});

  @override
  Widget build(BuildContext context) {
    return Text(
      textsInfo.text,
      textAlign: textsInfo.textAlign,
      style: TextStyle(
          fontSize: textsInfo.fontSize,
          fontWeight: textsInfo.fontWeight,
          fontStyle: textsInfo.fontStyle,
          color: textsInfo.color),
    );
  }
}
