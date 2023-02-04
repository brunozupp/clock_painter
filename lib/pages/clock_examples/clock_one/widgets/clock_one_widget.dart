import 'package:clock_painter/pages/clock_examples/clock_one/painters/clock_one_painter.dart';
import 'package:clock_painter/pages/clock_examples/clock_one/ui/clock_one_styles.dart';
import 'package:clock_painter/pages/clock_examples/clock_one/utils/clock_one_time_model.dart';
import 'package:flutter/material.dart';

class ClockOneWidget extends StatefulWidget {

  final ClockOneTimeModel time;

  const ClockOneWidget({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<ClockOneWidget> createState() => _ClockOneWidgetState();
}

class _ClockOneWidgetState extends State<ClockOneWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ClockOneStyle.primaryColor.withAlpha(80),
            blurRadius: 38.0
          ),
        ],
      ),
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ClockOnePainter(
          time: widget.time,
        ),
      ),
    );
  }
}