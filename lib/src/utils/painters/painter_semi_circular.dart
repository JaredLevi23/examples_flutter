import 'package:flutter/material.dart';

class PainterSemiCircular extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint()
      ..color=Colors.indigo
      ..style=PaintingStyle.fill
      ..strokeWidth=2;

    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo( size.width/2 , size.height/2, size.width, 0);

    canvas.drawPath(path, paint);
    
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

  
}