import 'package:flutter/material.dart';

class MultiStyleTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
        TextStyle? style,
        required bool withComposing}) {
    // Let's break our text into blocks divided by spaces
    final words = text.split(' ');
    final textSpanChildren = <TextSpan>[];

    // Add your text styling rules
    for (final word in words) {
      TextStyle wordStyle;
      if (word == 'blue') {
        wordStyle = TextStyle(color: Colors.blue);
      } else if (word == 'italic') {
        wordStyle = TextStyle(color: Colors.black, fontStyle: FontStyle.italic);
      } else {
        wordStyle = TextStyle(color: Colors.black);
      }
      final child = TextSpan(text: word, style: wordStyle);
      textSpanChildren.add(child);
      // Add the space back in
      textSpanChildren.add(TextSpan(text: ' '));
    }
    return TextSpan(children: textSpanChildren);
  }
}