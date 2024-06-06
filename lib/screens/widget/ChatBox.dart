import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:james_ai/screens/widget/CircleButton.dart';
import 'package:james_ai/theme/lightTheme.dart';
import 'package:pie_menu/pie_menu.dart';

class ChatBox  extends Widget {
  final TextEditingController controller ;
  final VoidCallback onSend ;
  final VoidCallback showMenu ;

  ChatBox({super.key,required this.controller,required this.onSend,required this.showMenu});



  @override
  Element createElement() {
    return StatefulElement(TextField(
      textAlign: TextAlign.left,
      controller: controller,
      onSubmitted: (te){onSend.call();},
      decoration: InputDecoration(
        hintText: 'Ask anything here..',
        hintStyle: TextStyle(fontSize: 16),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),

        filled: true,

        suffixIcon: CircleButton(onPressed: showMenu,icon:const Icon(Icons.add)),
        contentPadding: EdgeInsets.all(16),
        fillColor: LightTheme.highWhite,
      ),

    ) )
    ;
  }
}