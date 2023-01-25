import 'package:flutter/material.dart';

import 'package:clock_painter/pages/clock/painters/clock_painter.dart';
import 'package:clock_painter/pages/clock/ui/clock_styles.dart';
import 'package:clock_painter/pages/clock/utils/clock_time_model.dart';

class ClockWidget extends StatefulWidget {

  final ClockTimeModel time;

  const ClockWidget({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ClockStyle.primaryColor.withAlpha(80),
            blurRadius: 38.0
          ),
        ],
      ),
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ClockPainter(
          time: widget.time,
        ),
      ),
    );
  }
}