import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:james_ai/screens/Data.dart';
import 'package:james_ai/screens/widget/SearchRow.dart';
import 'package:james_ai/util/LangEn.dart';

import '../../theme/lightTheme.dart';
import '../../util/contsants.dart';
import '../pages/ChatPage.dart';
import 'DesignedTopPormotion.dart';

class HomeWidget{
  static Widget mainContainer(context,){
    return        Row(children: [

      Container(child: Stack(children: [
        Container(margin: EdgeInsets.only(top: 10),height:MediaQuery.of(context).size.height <500? MediaQuery.of(context).size.height/3.59:260, decoration: BoxDecoration(

          borderRadius: const BorderRadius.all(Radius.circular(20)),color: LightTheme.primaryColor,),child: Column(crossAxisAlignment:CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,
          children: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatPage(title: "title")),
            );
          }, icon:Stack(children: [

            Container(height: 120,
              decoration:   BoxDecoration(

                image:   DecorationImage(

                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  image: AssetImage(Constants.backImage
                  ),
                ),
              ),
            ),
            CircleAvatar(backgroundImage: AssetImage(Constants.mic
            ),)
          ],)),Container(child: Text("Talk with Cooper",style: LightTheme.largePont,)
              ,margin: EdgeInsets.only(left: 5,top: 5),),
            Container(child:Text("Let's try it now",style: LightTheme.textStyle,)
              ,margin: EdgeInsets.only(left: 5),)
        ],),width: MediaQuery.of(context).size
            .width/2.5,)
      ],), ),
      Column(children: [
        Stack(children: [
          Container(margin: EdgeInsets.only(top: 20),padding:EdgeInsets.all(10),child: Column(

            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,

            children: [
              IconButton(onPressed: (){}, icon:CircleAvatar(backgroundImage: AssetImage(Constants.chat_icon),)
              ),  Text("New Chat",style: LightTheme.largePont.copyWith(fontSize: 14),)
            ],), decoration: BoxDecoration(

            borderRadius: const BorderRadius.all(Radius.circular(20)),color: LightTheme.secColor,),width: MediaQuery.of(context).size
              .width/2.3,height:MediaQuery.of(context).size.height <500?  MediaQuery.of(context).size.height/7:130),Positioned(child: Container(decoration: BoxDecoration(                color: LightTheme.redOvers,

            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),   padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),child: Text("New",style: LightTheme.textStyle.copyWith(color: Colors.white),),),top: 8,right: 10,)
        ],),  Container(margin: EdgeInsets.only(top: 5,left: 5,right: 5),padding:EdgeInsets.all(10),child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,

          children: [
          IconButton(onPressed: (){}, icon: CircleAvatar(backgroundImage: AssetImage(Constants.image_search),))
            ,Text("Search by \n image",style: LightTheme.textStyle
            ,)
        ],), decoration: BoxDecoration(

          borderRadius: const BorderRadius.all(Radius.circular(20)),color: LightTheme.backDark,),width: MediaQuery.of(context).size
            .width/2.3,height:MediaQuery.of(context).size.height <500?  MediaQuery.of(context).size.height/7.5:120,)
      ],)
    ],);
  }
  static  PreferredSize appBar(List<Card> mcards,Card card,context){
    return PreferredSize(
      preferredSize: Size.fromHeight(80), // Set this height
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [Positioned(top: 60,child: CustomPaint(
            painter: DrawOnPathPainter(text:langEn.pormoText,type: 1),
          ),),
            Align(alignment: Alignment.centerRight,child:
            Container(child:  CircleAvatar(backgroundImage: AssetImage(Constants.image_profile),),
                margin: EdgeInsets.only(right: 20),
            )),
            Align(alignment: Alignment.centerLeft,child:
           Container(child:  DropdownButton<Card>(   underline: SizedBox(),
             iconSize: 0.0,
             items:mcards.map((Card value) {
               return DropdownMenuItem<Card>(
                 value: value,
                 child:value,
               );
             }).toList(),
             onChanged: (data) {
             },value: card,
           ),margin: EdgeInsets.only(
             left: 10,
             top: 5
           ),)


              ,),
          ],
        ),
      ),
    );
  }



  static Widget recentSearch(context,) {
    return Container(child:
        Expanded(child:   Column(children: [
        Container(child: Stack(
          children: [
            Align(child: Text("Recent Search",style: LightTheme.largePont.copyWith(fontSize: 16),),alignment: Alignment.centerLeft,)
            ,            Align(child: Text("See All",style: LightTheme.textStyle,),alignment: Alignment.centerRight,)

          ],
        ),margin: EdgeInsets.only(top: 20,left: 10,right: 20),),
       Expanded(child:  ListView( children: DataCollector.arr,)),

      ],),));

  }
}