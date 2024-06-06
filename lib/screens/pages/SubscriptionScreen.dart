import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:james_ai/screens/pages/HomePage.dart';
import 'package:james_ai/screens/widget/CardPayWidget.dart';
import 'package:james_ai/screens/widget/DesignedTopPormotion.dart';
import 'package:james_ai/theme/lightTheme.dart';
import 'package:james_ai/util/langEn.dart';

import '../../util/contsants.dart';
import '../widget/CircleButton.dart';



class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key, required this.title});


  final String title;

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(child: Container(child: Stack(
        children: [
          Positioned(top: 70,child:Transform.rotate(
              angle: -.0
              ,child:   CustomPaint(
            painter: DrawOnPathPainter(text:langEn.pormoText,type: 1),
          )),),
          Align(alignment: Alignment.topLeft,child: Container(child: Container(margin: const EdgeInsets.only(top: 45,left: 10),child: CircleButton(onPressed: (){
            Navigator.of(context).pop();
          },icon: const Icon(Icons.arrow_back_ios,size: 10
            ,color: Colors.black,),),),),),Container( child: Column(children: [
              SizedBox(height: MediaQuery.sizeOf(context).height/5,),
            Container(decoration:   BoxDecoration(               shape: BoxShape.circle,
              color: LightTheme.highWhite,
            ),width: 120,height:120,child:   Stack(children: [
              Align(alignment: Alignment.center,child:Container( child:    Container(width: 60,height:60,decoration:   BoxDecoration(               shape: BoxShape.circle,
                color: LightTheme.highWhite,
              ),child:    CircleAvatar(
                child: Image.asset(Constants.image_logo_path ,fit: BoxFit.fill,width: 60,height: 60,

                ),
              ), ),))

              ,Positioned( bottom: 0, right: 35, child: Container(decoration: BoxDecoration(                color: LightTheme.primaryColor,

                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),   padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),child:   Text(langEn.pro,style: LightTheme.textStyle,) ,),),const SizedBox(height: 20,)],),)
            ,  Text(langEn.cplans,style: LightTheme.largePont.copyWith(fontSize: 30,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
            Text(langEn.tryNow,style: LightTheme.textStyle,),   SizedBox(height: 45,),
            CardPayWidget(onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "title")),
            );  }, imagePath: '${Constants.image_avt1}', cardColor: LightTheme.primaryColor, title: 'Monthly Plan', price: '8.99',
              width: MediaQuery.sizeOf(context).width-40,) ,

            CardPayWidget(onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "title")),
            );  }, imagePath: Constants.image_avt2, cardColor:  LightTheme.secColor, title: 'Yearly Plan', price: '8.99',
              width: MediaQuery.sizeOf(context).width-40,)
            , SizedBox(height: 30,),
            ElevatedButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "title")),
            );},style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(LightTheme.backDark),), child:
            Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 20),child:Text("Subscription",style:
            LightTheme.largePont.copyWith(color: Colors.white,fontSize: 16),)),
            ),  ],
          ),)
        ],
      ),
      ),
      )
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
