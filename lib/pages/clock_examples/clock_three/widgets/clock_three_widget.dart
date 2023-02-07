import 'package:clock_painter/pages/clock_examples/clock_three/painters/clock_three_painter.dart';
import 'package:flutter/material.dart';

class ClockThreeWidget extends StatelessWidget {

  const ClockThreeWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: ClockThreePainter(),
      ),
    );
  }
}