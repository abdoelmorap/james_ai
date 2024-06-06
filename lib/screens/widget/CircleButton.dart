import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton  extends Widget {
  VoidCallback? onPressed;
  Widget? icon;
    CircleButton({super.key,    required this.onPressed,required this.icon });



  @override
  Element createElement() {
    return StatefulElement(  ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(5)),
        backgroundColor: MaterialStateProperty.all(     Color(0xFFF8F8FC)), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) return Colors.grey; // <-- Splash color
        }),
      ),
      child:icon ,
    ));
  }
}