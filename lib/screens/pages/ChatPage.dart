import 'dart:convert';

import 'package:floating_menu_panel/floating_menu_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:james_ai/screens/widget/ChatWidget.dart';
import 'package:james_ai/screens/widget/CircleButton.dart';
import 'package:james_ai/screens/widget/HomeWidget.dart';
import 'package:james_ai/theme/lightTheme.dart';
import 'package:james_ai/util/LangEn.dart';
import 'package:james_ai/util/contsants.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:http/http.dart' as http;

import '../../core/models/EdenModel.dart';
import '../../core/models/imageModel.dart';
import '../../core/models/msgModel.dart';
import 'SubscriptionScreen.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});


  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var formKey ;
  int _counter = 0;
  bool showMenu= false;

  List<msgModel> _wmessages = [];
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  var scaffoldKey ;
  late FocusNode myFocusNode;
  List<Card> cards= [
    Card(child:    Row(children: [
      CircleAvatar(backgroundImage: AssetImage(Constants.image_logo_path2)),const Text("  Cooper1.7 "),Transform.rotate(angle: 22/7*1.5,child: Icon(Icons.arrow_back_ios,size: 16,),),SizedBox(width: 10,)]),
    ),         Card(child:    Row(children: [
      CircleAvatar(backgroundImage: AssetImage(Constants.image_logo_path2)),const Text("  Cooper1.8 "),Transform.rotate(angle: 22/7*1.5,child: Icon(Icons.arrow_back_ios,size: 16,),),SizedBox(width: 10,)]),
    ),         Card(child:    Row(children: [
      CircleAvatar(backgroundImage: AssetImage(Constants.image_logo_path2)),const Text("  Cooper1.9 "),Transform.rotate(angle: 22/7*1.5,child: Icon(Icons.arrow_back_ios,size: 16,),),SizedBox(width: 10,)]))];

  @override
  Widget build(BuildContext context) {

   var card = cards.first;
    return
    //   PieCanvas(theme:
    //     const PieTheme(
    //     delayDuration: Duration.zero,
    //     buttonTheme:  PieButtonTheme(
    //       backgroundColor: Colors.black,
    //       iconColor: Colors.white,
    //     ),tooltipTextStyle: TextStyle(color: Colors.transparent)
    // ),
    // child:
    Scaffold(
       appBar:ChatWidget.appBar(cards,card,context),
      body: Container(
        decoration: BoxDecoration(

          borderRadius: const BorderRadius.all(Radius.circular(20)),color: LightTheme.purpleWhite,),
        margin: EdgeInsets.only(top: 40),
        child: Stack(children: [
          Column(children: [Flexible(
              child:Container(margin:
              EdgeInsets.only(left: 10,right: 10),child: ChatWidget.buildListMessage(_wmessages,listScrollController,context),)),
            ChatWidget.chatContainer(textEditingController,(){
              _handleSendPressed(textEditingController.text);
            },(){

              showMenu=!showMenu;
setState(() {

});
            },
            )
          ]),
          Positioned(bottom: 90,right: 15,child: showMenu?Container(decoration: BoxDecoration(                color: LightTheme.backDark,

            borderRadius: const BorderRadius.all(Radius.circular(45)),
          ),padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Column(children: [
              IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SubscriptionPage(title: "title")),
                );
              }, icon:Icon(Icons.mic,color: LightTheme.white,),  style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(     Color(0xFF38393D)), // <-- Button color
                overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) return Colors.grey; // <-- Splash color
                }),
              )),
              IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SubscriptionPage(title: "title")),
                );
              }, icon:Icon(Ionicons.image_outline,color: LightTheme.white,),style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(     Color(
                    0xFF38393D)), // <-- Button color
                overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) return Colors.grey; // <-- Splash color
                }),
              )),
              IconButton(onPressed: (){

                _handleSendPressed(textEditingController.text);
              }, icon:Icon(Icons.send,color: LightTheme.white,),style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(     Color(
                    0xFF38393D)), // <-- Button color
                overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) return Colors.grey; // <-- Splash color
                }),
              ))

            ],),
          ):Container(),)
        ],),

      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }

  void _handleSendPressed( message)async {

    textEditingController.text="";
    setState(() {
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



    setState(() {
      _wmessages.add(msgModel(EdenAiModel.fromJson(jsonDecode(responsess.body)), true,1))  ;    // _messages = messages;

      listScrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
    });





  }
  void StartApp(){
    _wmessages.add(msgModel(EdenAiModel(cohere:Cohere(status: "",generatedText: "Provide statistics on the development of the Indonesian population") ), false,1))  ;    // _messages = messages;
    _wmessages.add(msgModel(EdenAiModel(cohere:Cohere(status: "",generatedText: "Well, here's the latest statistics data on Indonesia's Population ") ), true,1))  ;    // _messages = messages;
    _wmessages.add(msgModel(EdenAiModel(cohere:Cohere(status: "",generatedText: "") ), true,2))  ;    // _messages = messages;

  }
  @override
  void initState() {
    myFocusNode = FocusNode();

    StartApp();

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final formKey = GlobalKey<FormState>();
    final TextEditingController _controller = new TextEditingController();
    super.initState();
  }
}
