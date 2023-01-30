import 'dart:math';

import 'package:flutter/material.dart';

class ClockTwoPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final fillBrush = Paint()
      ..color = const Color(0xFF444974);

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    canvas.drawCircle(center, radius - 40, fillBrush);

    final outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius - 40, outlineBrush);

    final secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, Offset(100,100), secHandBrush);

    final minHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Colors.lightBlue,
          Colors.pink,
        ]
      ).createShader(Rect.fromCircle(
        center: center, 
        radius: radius,
      ))
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, Offset(150,100), minHandBrush);

    final hourHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Colors.lightBlue,
          Colors.pink,
        ]
      ).createShader(Rect.fromCircle(
        center: center, 
        radius: radius,
      ))
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, Offset(200,100), hourHandBrush);

    final centerFillBrush = Paint()
      ..color = const Color(0xFFEAECFF);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
