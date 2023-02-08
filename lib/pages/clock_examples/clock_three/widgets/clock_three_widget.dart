import 'dart:math';

import 'package:flutter/material.dart';

import 'package:clock_painter/pages/clock_examples/clock_three/painters/clock_three_painter.dart';

class ClockThreeWidget extends StatelessWidget {

  final DateTime date;

  const ClockThreeWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size.width;
    
    return Transform.rotate(
      angle: (3 * pi) / 2,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: ClockThreePainter(
            date: date,
          ),
        ),
      ),
    );
  }
}
