import 'package:james_ai/screens/widget/SearchRow.dart';

import '../theme/lightTheme.dart';
import '../util/contsants.dart';

abstract class DataCollector{
  static var arr=[

    SearchRow(onPressed: (){}, imagePath: Constants.mic, cardColor: LightTheme.cardBackground, title: "What is a wild animals?"),

    SearchRow(onPressed: (){}, imagePath: Constants.image_search, cardColor: LightTheme.cardBackground, title: "Searching Images"),

    SearchRow(onPressed: (){}, imagePath: Constants.chat_icon, cardColor: LightTheme.cardBackground, title: "Analysis my dribble shot"),

    SearchRow(onPressed: (){}, imagePath: Constants.mic, cardColor: LightTheme.cardBackground, title: "How show the prototype figma?"),

    SearchRow(onPressed: (){}, imagePath: Constants.chat_icon, cardColor: LightTheme.cardBackground, title: "What is a Atom?"),

    SearchRow(onPressed: (){}, imagePath: Constants.image_search, cardColor: LightTheme.cardBackground, title: "Searching Images"),

    SearchRow(onPressed: (){}, imagePath: Constants.mic, cardColor: LightTheme.cardBackground, title: "What is a Pizza?"),
  ];
}