import 'dart:math';

import 'package:flutter/material.dart';

class ClockThreePainter extends CustomPainter {

  final DateTime date;

  ClockThreePainter({
    required this.date,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    
    // Variáveis do posicionamento do círculo a ser desenhado
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final bodyClockPaint = Paint()
      ..color = Colors.blueGrey;

    canvas.drawCircle(center, radius, bodyClockPaint);

    final edgeClockPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, edgeClockPaint);

    final secondClockPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    // 60 segundos necessários para dar uma volta completa = 360 graus
    // 1 segundo = 6 graus
    final secX = centerX + (radius - 20) * cos(date.second * 6 * pi / 180);
    final secY = centerY + (radius - 20) * sin(date.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secX, secY), secondClockPaint);

    final minuteClockPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // 60 minutos necessários para dar uma volta completa = 360 graus
    // 1 minuto = 6 graus
    final minX = centerX + (radius - 40) * cos(date.minute * 6 * pi / 180);
    final minY = centerY + (radius - 40) * sin(date.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minX, minY), minuteClockPaint);

    final hourClockPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    // 12 horas necessárias para dar uma volta completa = 360 graus
    // 1 hora = 30 graus
    // Passando o minuto para a base de hora: 1 minuto = 0.5 graus
    final hourX = centerX + (radius - 60) * cos((date.hour * 30 + date.minute * 0.5) * pi / 180);
    final hourY = centerY + (radius - 60) * sin((date.hour * 30 + date.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hourX, hourY), hourClockPaint);

    final circleCenterPaint = Paint()
      ..color = Colors.grey;
    
    canvas.drawCircle(center, 16, circleCenterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}
