import 'package:draw_on_path/draw_on_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:james_ai/util/LangEn.dart';

class DrawOnPathPainter extends CustomPainter {


    bool showPath=true;
    bool autoSpacing=false;
    bool isClosed=false;
    final  int type;
    double letterSpacing =1.5;
   final String text;

   bool textOrPattern=false;
   DrawOnPathPainter({required this.text, this.type=0} );
    Path _createWavePath() {
if(type==0) {
  var path = Path();
  var size = Size(400, 0);
  path.lineTo(
      -20, size.height); //start path with this if you are making at bottom

  var firstStart = Offset(size.width / 5, size.height + 50);
  //fist point of quadratic bezier curve
  var firstEnd = Offset(size.width / 2.35, size.height - 40.0);
  //second point of quadratic bezier curve
  path.quadraticBezierTo(
      firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

  var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
  //third point of quadratic bezier curve
  var secondEnd = Offset(size.width, size.height - 10);
  //fourth point of quadratic bezier curve
  path.quadraticBezierTo(
      secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

  // path.lineTo(size.width, 0); //end with this path if you are making wave at bottom

  return path;
}else if(type==1){
  var path = Path();
  var size = Size(400, 20);
  var secondStart = Offset(size.width/7, size.height - 105);
  //third point of quadratic bezier curve
  var secondEnd = Offset(size.width/3, size.height - 10);
  //fourth point of quadratic bezier curve
  path.quadraticBezierTo(
      secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
 //start path with this if you are making at bottom

  var firstStart = Offset(size.width -(size.width/3), size.height+100 );
  //fist point of quadratic bezier curve
  var firstEnd = Offset(size.width, size.height-100 );
  //second point of quadratic bezier curve
  path.quadraticBezierTo(
      firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);



  // path.lineTo(size.width, 0); //end with this path if you are making wave at bottom

  return path;

}else{
  throw "Hi";
}
    }

  final whitePaint = Paint()
    ..color = const Color(0xFFEFECFE)
    ..strokeWidth = 34.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    if (showPath) {
      canvas.drawPath(_createWavePath(), whitePaint);
    }

    if (textOrPattern) {
      canvas.drawOnPath(_createWavePath(), _drawAtElement, spacing: letterSpacing == 0 ? 70 : letterSpacing);
    } else {
      canvas.drawTextOnPath(
        text,
        _createWavePath(),
        textStyle: const TextStyle(fontSize: 21, color: Colors.black),
        autoSpacing: autoSpacing,
        isClosed: isClosed,
        letterSpacing: letterSpacing,
      );
    }
  }

  void _drawAtElement(int index, Canvas canvas, Offset position) {
    final patternPosition = index % 3;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;


  }

  @override
  bool shouldRepaint(DrawOnPathPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(DrawOnPathPainter oldDelegate) => false;
}