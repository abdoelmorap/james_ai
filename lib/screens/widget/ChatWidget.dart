import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:james_ai/screens/widget/ChatBox.dart';
import 'package:james_ai/screens/widget/CircleButton.dart';
import 'package:james_ai/theme/lightTheme.dart';

import '../../core/models/msgModel.dart';
import '../../util/contsants.dart';

abstract class ChatWidget{

  static PreferredSize appBar(List<Card>mcards,card,context){
    return PreferredSize(      preferredSize: Size.fromHeight(80), // Set this height
         child: Stack(children: [
           
           Align(child: CircleButton(onPressed: (){
             Navigator.of(context).pop(true);
             }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.grey,)),alignment:Alignment.centerLeft),
           Align(alignment: Alignment.center,child:
           Container(margin: const EdgeInsets.only(
               left: 10,
               top: 5
           ),child:  DropdownButton<Card>(   underline: SizedBox(),
             iconSize: 0.0,
             items:mcards.map((Card value) {
               return DropdownMenuItem<Card>(
                 value: value,
                 child:value,
               );
             }).toList(),
             onChanged: (data) {
             },value: card,
           ),)


             ,),
           Align(alignment:Alignment.centerRight, child: CircleButton(onPressed: (){}, icon: const Icon(Ionicons.ellipsis_horizontal_outline,color: Colors.black,))),

         ],)
    );
  }

  static Widget chatContainer(TextEditingController textEditingController,onSend,showMenuEvent){
    return
      Container(child: ChatBox(controller: textEditingController, onSend:onSend,showMenu: showMenuEvent, ),
      height: 80,
      margin: EdgeInsets.only(top: 0,bottom: 5,left: 10,right: 10),);
  }


  static Widget buildListMessage(_wmessages,listScrollController,contextOfParent) {
    return  ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {

          return
            buildItem(_wmessages[_wmessages.length-1-index],contextOfParent);


        },
        itemCount:_wmessages.length,
        reverse: true,
        controller: listScrollController,


    );
  }
  static  Widget buildItem(msgModel msg,context){
    return msg.side==true?
    msg.type ==1?
   Column(children: [Row(children: [const CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo.png")
        ),SizedBox(width: 5,),Text("Cooper")],),SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.start //Center Row contents horizontally,
          , crossAxisAlignment: CrossAxisAlignment.start //Center Row contents vertically,
          ,  children: [
            const SizedBox(height: 15,),
            SizedBox(width: MediaQuery.sizeOf(context).width*75/100,child: Container(decoration: BoxDecoration(            color:LightTheme.white,

              borderRadius: const BorderRadius.only(topRight:Radius.circular(30),
                  bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
            ),
                child:
                Padding(padding: const EdgeInsets.all(20),child:
                Column(

                    crossAxisAlignment:CrossAxisAlignment.start,

                    children: [   const SizedBox(height: 5,),
                      Text(msg.content.cohere!.generatedText.toString(),
                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                            color: Colors.black),textAlign: TextAlign.start,),
                      const SizedBox(height: 5,),

                      const SizedBox(height: 5,)]
                ),)
            )  ,)],)]):


       Container(margin: EdgeInsets.only(top: 0,bottom: 10),child:    Column(mainAxisAlignment: MainAxisAlignment.start //Center Row contents horizontally,
         , crossAxisAlignment: CrossAxisAlignment.start //Center Row contents vertically,
         ,  children: [
           const SizedBox(height: 25,),
           SizedBox(width: MediaQuery.sizeOf(context).width*75/100,child: Container(decoration: BoxDecoration(            color:LightTheme.white,

             borderRadius: const BorderRadius.only(topRight:Radius.circular(25),topLeft:Radius.circular(25),
                 bottomLeft:Radius.circular(25),bottomRight:Radius.circular(25)),
           ),
               child:
               Padding(padding: const EdgeInsets.all(20),child:
               Column(

                   crossAxisAlignment:CrossAxisAlignment.start,

                   children: [   const SizedBox(height: 5,),
                     Text("2022",
                       style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                           color: Colors.black),textAlign: TextAlign.start,),
                     const SizedBox(height: 5,),
                     Text("275.5 million",
                       style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                           color: Colors.black),textAlign: TextAlign.start,),
                     const SizedBox(height: 5,),Image.asset("assets/images/img_qraph.png"),
                     const SizedBox(height: 5,)
                   ]
               ),)
           )  ,),        const SizedBox(height: 5,),   Text("Just now") ],),):





        Column(mainAxisAlignment: MainAxisAlignment.end //Center Row contents horizontally,
          , crossAxisAlignment: CrossAxisAlignment.end //Center Row contents vertically,
          ,  children: [
            Row(children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/photo.jpg"),
              ),SizedBox(width: 5,),Text("Me")
            ],mainAxisAlignment: MainAxisAlignment.end //Center Row contents horizontally,
    , crossAxisAlignment: CrossAxisAlignment.center ),SizedBox(height: 10,),
            SizedBox(width: MediaQuery.sizeOf(context).width*60/100,child:  Container(decoration: BoxDecoration(            color:LightTheme.primaryColor,

              borderRadius: const BorderRadius.only(topLeft:Radius.circular(30),
                  bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
            ),
                child:
                Padding(padding: const EdgeInsets.all(20),child:
                Column(

                    crossAxisAlignment:CrossAxisAlignment.end,

                    children: [   const SizedBox(height: 5,),
                      Text(msg.content.cohere!.generatedText.toString(),
                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                            color: Colors.black),textAlign: TextAlign.start,),
                      const SizedBox(height: 5,)
               ]
                ),)
            )  ,),SizedBox(height: 5,),
            Text("1 mins ago")   ],);

  }


}