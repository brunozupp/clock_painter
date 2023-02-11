import 'dart:math';

import 'package:flutter/material.dart';

class ClockFourPainter extends CustomPainter {

  final DateTime date;

  ClockFourPainter({
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
    final secX = centerX + (radius - 40) * cos(date.second * 6 * pi / 180);
    final secY = centerY + (radius - 40) * sin(date.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secX, secY), secondClockPaint);

    final minuteClockPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // 60 minutos necessários para dar uma volta completa = 360 graus
    // 1 minuto = 6 graus
    final minX = centerX + (radius - 60) * cos(date.minute * 6 * pi / 180);
    final minY = centerY + (radius - 60) * sin(date.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minX, minY), minuteClockPaint);

    final hourClockPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    // 12 horas necessárias para dar uma volta completa = 360 graus
    // 1 hora = 30 graus
    // Passando o minuto para a base de hora: 1 minuto = 0.5 graus
    final hourX = centerX + (radius - 80) * cos((date.hour * 30 + date.minute * 0.5) * pi / 180);
    final hourY = centerY + (radius - 80) * sin((date.hour * 30 + date.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hourX, hourY), hourClockPaint);

    final circleCenterPaint = Paint()
      ..color = Colors.grey;
    
    canvas.drawCircle(center, 16, circleCenterPaint);

    // Pontos de indicação da hora ------------------------

    final pointHourPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    final pointMinutePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for(int i = 0; i < 12; i++) {
      
      // Usando o radius aqui pois ele se aproxima da borda
      final pointX1 = centerX + (radius - 20) * cos(i * 30 * pi / 180);
      final pointY1 = centerY + (radius - 20) * sin(i * 30 * pi / 180);

      final pointX2 = centerX + (radius - 30) * cos(i * 30 * pi / 180);
      final pointY2 = centerY + (radius - 30) * sin(i * 30 * pi / 180);

      canvas.drawLine(
        Offset(pointX1, pointY1),
        Offset(pointX2, pointY2),
        pointHourPaint,
      );

      // De 1 até 4 representando os minutos entre cada hora
      for(int j = 1; j <= 4; j++) {
        
        // Fazendo o grau do minuto se locomover a cada iteração + o grau da hora
        // para localizar o ponto de partida dos pontos de minuto que vão ser
        // desenhados
        final pointX1 = centerX + (radius - 20) * cos((j * 6 + i * 30) * pi / 180);
        final pointY1 = centerY + (radius - 20) * sin((j * 6 + i * 30) * pi / 180);

        final pointX2 = centerX + (radius - 30) * cos((j * 6 + i * 30) * pi / 180);
        final pointY2 = centerY + (radius - 30) * sin((j * 6 + i * 30) * pi / 180);
      
        canvas.drawLine(
          Offset(pointX1, pointY1),
          Offset(pointX2, pointY2),
          pointMinutePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}
