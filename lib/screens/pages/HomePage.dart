

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:james_ai/screens/pages/ChatPage.dart';
import 'package:james_ai/screens/widget/HomeWidget.dart';
import 'package:james_ai/theme/lightTheme.dart';
import 'package:james_ai/util/LangEn.dart';
import 'package:james_ai/util/contsants.dart';

import '../widget/DesignedTopPormotion.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    var mcards= [
      Card(child:    Row(children: [
        CircleAvatar(backgroundImage: AssetImage(Constants.image_logo_path2)),const Text("  Cooper1.7 "),Transform.rotate(angle: 22/7*1.5,child: Icon(Icons.arrow_back_ios,size: 16,),),SizedBox(width: 10,)]),
      ),         Card(child:    Row(children: [
        CircleAvatar(backgroundImage: AssetImage(Constants.image_logo_path2)),const Text("  Cooper1.8 "),Transform.rotate(angle: 22/7*1.5,child: Icon(Icons.arrow_back_ios,size: 16,),),SizedBox(width: 10,)]),
      ),         Card(child:    Row(children: [
        CircleAvatar(backgroundImage: AssetImage(Constants.image_logo_path2)),const Text("  Cooper1.9 "),Transform.rotate(angle: 22/7*1.5,child: Icon(Icons.arrow_back_ios,size: 16,),),SizedBox(width: 10,)]))];

    var  card =mcards.first;
    return Scaffold(
      appBar:HomeWidget.appBar(mcards,card,context),
      body: Container(

        margin: EdgeInsets.fromLTRB(20, 5, 10, 5),

        child: Center( child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(langEn.hello,style: LightTheme.largePont.copyWith(fontFamily: "poppins",fontWeight: FontWeight.w700),),
            Text(langEn.welcomeSeconce,style: LightTheme.textStyle,),
  GestureDetector(child:   HomeWidget.mainContainer(context),onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatPage(title: "title")),
    );
  },),

            HomeWidget.recentSearch(context),
          ],
        ),),),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
