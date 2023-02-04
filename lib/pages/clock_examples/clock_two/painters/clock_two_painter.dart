import 'dart:math';

import 'package:flutter/material.dart';

class ClockTwoPainter extends CustomPainter {

  final DateTime date;

  ClockTwoPainter({
    required this.date,
  });

  // Vai 60 segundos para completar 360 graus -> 1 sec = 6 graus
  // Vai 12 horas para completar 360 graus -> 1 hora = 30 graus -> 1 min -> 0.5 graus
  
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

    final minHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFF748EF6),
          Color(0xFF77DDFF),
        ]
      ).createShader(Rect.fromCircle(
        center: center, 
        radius: radius,
      ))
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final hourHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFEA74BA),
          Color(0xFFC279FB),
        ]
      ).createShader(Rect.fromCircle(
        center: center, 
        radius: radius,
      ))
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final hourHandX = centerX + 80 * cos((date.hour * 30 + date.minute * 0.5) * pi / 180);
    final hourHandY = centerY + 80 * sin((date.hour * 30 + date.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX,hourHandY), hourHandBrush);

    final minHandX = centerX + 80 * cos(date.minute * 6 * pi / 180);
    final minHandY = centerY + 80 * sin(date.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);

    final secHandX = centerX + 80 * cos(date.second * 6 * pi / 180);
    final secHandY = centerY + 80 * sin(date.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

    final centerFillBrush = Paint()
      ..color = const Color(0xFFEAECFF);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
