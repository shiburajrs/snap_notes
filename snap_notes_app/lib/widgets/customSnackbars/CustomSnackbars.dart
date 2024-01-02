import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/FontUtils.dart';

class CustomSnacbars {
  static successSnackBar(BuildContext context,String content){
    return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      backgroundColor: Colors.green,
      content: CustomText(text: content,
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300),
    ));
  }

  static errorSnackBar(BuildContext context,String messsage){
    return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      backgroundColor: Colors.red,
      content: CustomText(text: messsage,
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700),
    ));
  }
}