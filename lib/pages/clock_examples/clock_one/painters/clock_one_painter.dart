import 'dart:math';

import 'package:clock_painter/pages/clock_examples/clock_one/ui/clock_one_styles.dart';
import 'package:clock_painter/pages/clock_examples/clock_one/utils/clock_one_time_model.dart';
import 'package:flutter/material.dart';

class ClockOnePainter extends CustomPainter {

  final ClockOneTimeModel time;

  ClockOnePainter({
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {

    final secRadius = ((pi / 2) - (pi / 30) * time.sec) % (2 * pi);
    final minRadius = ((pi / 2) - (pi / 30) * time.min) % (2 * pi);
    final hourRadius = ((pi / 2) - (pi / 6) * time.hour) % (2 * pi);
    
    // Points coordinates
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    // Clock coordinate
    final secHeight = radius / 2;
    final minHeight = radius / 2 - 10;
    final hourHeight = radius / 2 - 25;

    final seconds = Offset(
      centerX + secHeight * cos(secRadius),
      centerY - secHeight * sin(secRadius),
    );

    final minutes = Offset(
      centerX + minHeight * cos(minRadius),
      centerY - minHeight * sin(minRadius),
    );

    final hours = Offset(
      centerX + hourHeight * cos(hourRadius),
      centerY - hourHeight * sin(hourRadius),
    );

    final fillBrush = Paint()
      ..color = ClockOneStyle.primaryColor
      ..strokeCap = StrokeCap.round;

    final centerDotBrush = Paint()
      ..color = const Color(0xFFEAECFF);

    // Setting the hand brush
    final secBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    final minBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;

    final hourBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;

    // Draw the body
    canvas.drawCircle(center, radius - 40, fillBrush);

    // Draw the clock hands
    canvas.drawLine(center, seconds, secBrush);
    canvas.drawLine(center, minutes, minBrush);
    canvas.drawLine(center, hours, hourBrush);

    // Draw the center dot
    canvas.drawCircle(center, 16, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}
