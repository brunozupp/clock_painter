import 'dart:async';
import 'dart:math';

import 'package:clock_painter/pages/clock_examples/clock_two/painters/clock_two_painter.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${currentTime.hour.toString().padLeft(2,"0")}:${currentTime.minute.toString().padLeft(2,"0")}:${currentTime.second.toString().padLeft(2,"0")}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
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
        ),
      ],
    );
  }
}