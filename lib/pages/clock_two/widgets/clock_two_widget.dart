import 'dart:async';
import 'dart:math';

import 'package:clock_painter/pages/clock_two/painters/clock_two_painter.dart';
import 'package:flutter/material.dart';

class ClockTwoWidget extends StatefulWidget {
  const ClockTwoWidget({super.key});

  @override
  State<ClockTwoWidget> createState() => _ClockTwoWidgetState();
}

class _ClockTwoWidgetState extends State<ClockTwoWidget> {
  
  DateTime currentTime = DateTime.now();

  late Timer timer;

  @override
  void initState() {
    
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        currentTime = currentTime.add(const Duration(seconds: 1));
      });
    });
  }

  @override
  void dispose() {
    
    timer.cancel();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockTwoPainter(
            date: currentTime,
          ),
        ),
      ),
    );
  }
}