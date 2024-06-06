import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:james_ai/theme/lightTheme.dart';

class CardPayWidget  extends Widget {
  VoidCallback? onPressed;
  String? imagePath;
  Color? cardColor;
  String? title;
  String? price;
  double? width;
  CardPayWidget({super.key,    required this.onPressed,required this.imagePath,required this.cardColor,required this.width
    ,required this.title,required this.price});



  @override
  Element createElement() {
    return StatelessElement(  Container(decoration:   BoxDecoration( border: Border.all(color: cardColor!),borderRadius: BorderRadius.circular(15)
        ,color: cardColor),height: 130,width:width,margin: EdgeInsets.fromLTRB(10, 3, 10, 4),child: Stack(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,children: [Container(child: CircleAvatar(
        radius: 48, // Image radius
        backgroundImage:AssetImage(imagePath! , ),
      ) ,width: 50,margin: EdgeInsets.fromLTRB(10, 0, 10, 50),),
        Column(children: [const SizedBox(height: 12,),Text("$title",style: LightTheme.largePont.copyWith(fontSize: 17),),const SizedBox(height: 5,),
        Text("\$ $price/month",style: LightTheme.textStyle)],)

      ],
      ),Positioned(bottom: 40,right: 20,left: 20,child: Container( height: .3,color: Colors.black,margin: const EdgeInsets.all(10),),)
      ,const Positioned(
        bottom: 20,left: 10,
        child: Row(children: [
          SizedBox(width: 5,),Icon(Icons.check_circle), SizedBox(width: 5,),Text("Chat unlimited"),
          SizedBox(width: 25,),     Icon(Icons.check_circle), SizedBox(width: 5,),Text("Notify automatic"),
        ],),
      ),

   Positioned(right: 10,top: 10,child:
   OutlinedButton(onPressed: onPressed, child:  Text("Free ads",style:
   LightTheme.textStyle.copyWith(color: Colors.black),), style: ButtonStyle(
    side: MaterialStateProperty.all(
    BorderSide.lerp(
    const BorderSide(
    style: BorderStyle.solid,
    color: Color(0xff585768),
    width: 2.0,
    ),
    const BorderSide(
    style: BorderStyle.solid,
    color: Color(0xff585768),
    width: 2.0,
    ),
    8.0),
    ),)),height: 30,), ],),),
    );
  }
}