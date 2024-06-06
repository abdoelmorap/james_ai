 import 'dart:convert';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;
import 'models/EdenModel.dart';
import 'models/msgModel.dart';

abstract class DataController{

static void handleSendPressed( message,_wmessages,listScrollController,textEditingController, context )async {

  textEditingController.text="";
  context.setState(() {
    _wmessages.add(msgModel(EdenAiModel(cohere:Cohere(status: "",generatedText: message) ), false,1))  ;    // _messages = messages;

    listScrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut); });






  var urls = Uri.https('api.edenai.run', 'v2/text/generation');
  var responsess = await http.post(urls,
      body:    jsonEncode({
        'providers': 'cohere',
        'text': message,
        'temperature':'0.2',
        'max_tokens': '1500'
      })
      ,headers: {'accept':'application/json',
        'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZGE5MTRiYTMtZWI4OS00NGU0LThiYjgtM2Q2MjlkZTBiMGFlIiwidHlwZSI6ImFwaV90b2tlbiJ9._CdWlh3jC9bbfqS6AgcF0P20xKfLcKUcTw_-0NrK52Q',
        'content-type' :'application/json',
      });



  context.setState(() {
    _wmessages.add(msgModel(EdenAiModel.fromJson(jsonDecode(responsess.body)), true,1))  ;    // _messages = messages;

    listScrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  });





}
}