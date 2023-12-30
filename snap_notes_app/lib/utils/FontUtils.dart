import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow overflow;

  // Add more parameters as needed for customization

  CustomText({
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}

class FontStyles {
  static const String nunito = 'Nunito';

  static const TextStyle black = TextStyle(fontFamily: '$nunito-Black');
  static const TextStyle bold = TextStyle(fontFamily: '$nunito-Bold');
  static const TextStyle extraBold = TextStyle(fontFamily: '$nunito-ExtraBold');
  static const TextStyle light = TextStyle(fontFamily: '$nunito-Light');
  static const TextStyle medium = TextStyle(fontFamily: '$nunito-Medium');
  static const TextStyle regular = TextStyle(fontFamily: '$nunito-Regular');
  static const TextStyle semiBold = TextStyle(fontFamily: '$nunito-SemiBold');
}
