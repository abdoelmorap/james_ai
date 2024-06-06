import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:james_ai/theme/lightTheme.dart';

class SearchRow  extends Widget {
  VoidCallback? onPressed;
  String? imagePath;
  Color? cardColor;
  String? title;
  SearchRow({super.key,    required this.onPressed,required this.imagePath,required this.cardColor
    ,required this.title});



  @override
  Element createElement() {
    return StatelessElement(  Container(decoration:   BoxDecoration( border: Border.all(color: cardColor!),borderRadius: BorderRadius.circular(25)
        ,color: cardColor),margin: EdgeInsets.fromLTRB(10, 3, 10, 4),padding: EdgeInsets.all(10),child: Stack(children: [
      Align(alignment: Alignment.centerRight,child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,children: [
          Row(children: [
            CircleAvatar(backgroundImage: AssetImage(this.imagePath!),),SizedBox(width: 5,),Text(this.title.toString(),style:
              LightTheme.largePont.copyWith(fontWeight:FontWeight.normal,fontSize: 14),)
            
          ],)
      ]),),Align(child: Padding(child: Icon(Ionicons.ellipsis_horizontal_outline),padding: EdgeInsets.all(5),) ,alignment: Alignment.centerRight,) ],),),
    );
  }
}