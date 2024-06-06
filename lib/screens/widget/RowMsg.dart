import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:james_ai/theme/lightTheme.dart';
import 'package:james_ai/util/contsants.dart';

class RowMsg  extends Widget {
  VoidCallback? onPressed;
  String? imagePath;
  Color? cardColor;
  String? msg;
  int? type;
  RowMsg({super.key,    required this.onPressed,required this.imagePath,required this.cardColor
    ,required this.msg,this.type});



  @override
  Element createElement() {
    return StatelessElement(  Container(
      child: Column(children: [
        Row(children: [
          Text("Me"),CircleAvatar(backgroundImage: AssetImage(Constants.image_profile),)

        ],)
      ],),
    ));
  }
}