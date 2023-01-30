import 'package:clock_painter/pages/clock_two/painters/clock_two_painter.dart';
import 'package:flutter/material.dart';

class ClockTwoWidget extends StatefulWidget {
  const ClockTwoWidget({super.key});

  @override
  State<ClockTwoWidget> createState() => _ClockTwoWidgetState();
}

class _ClockTwoWidgetState extends State<ClockTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockTwoPainter(),
      ),
    );
  }
}