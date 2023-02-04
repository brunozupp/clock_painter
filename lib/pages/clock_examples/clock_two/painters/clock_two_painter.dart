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

    // Esse 80 = Distance you want the coordinate that you have to provide
    // Pode-se dizer que esse 80 é o radius que vai ser aplicado para o tamanho da seta
    // Está multiplicando com o minuto junto pois dessa forma não vai aumentar a hora
    // apenas quando passar de hora em hora, mas vai mudando o indicador regularmente
    // a cada minuto que vai passando, igual acontece com um relógio real.
    final hourHandX = centerX + 50 * cos((date.hour * 30 + date.minute * 0.5) * pi / 180);
    final hourHandY = centerY + 50 * sin((date.hour * 30 + date.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX,hourHandY), hourHandBrush);

    // Está fazendo * 6 para alinhar cada segundo/minuto com seu respectivo grau na circunferência
    final minHandX = centerX + 65 * cos(date.minute * 6 * pi / 180);
    final minHandY = centerY + 65 * sin(date.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);

    // Está fazendo * 6 para alinhar cada segundo/minuto com seu respectivo grau na circunferência
    final secHandX = centerX + 85 * cos(date.second * 6 * pi / 180);
    final secHandY = centerY + 85 * sin(date.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

    final centerFillBrush = Paint()
      ..color = const Color(0xFFEAECFF);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
