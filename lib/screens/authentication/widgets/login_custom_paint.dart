import 'package:festi/utils/colors.dart';
import 'package:flutter/material.dart';

class CurvePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = ColorsFesti.AzulFesti;

    var path = Path();
    path.moveTo(0, size.height*0.23);
    path.quadraticBezierTo(size.width*0.13, size.height*0.30, size.width*0.5, size.height*0.31);
    path.quadraticBezierTo(size.width*0.95, size.height*0.32, size.width*1, size.height*0.43);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}