import 'dart:math' as math;

import 'package:flutter/material.dart';
  
class PolygonOnePage extends StatelessWidget {

  const PolygonOnePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polygon Example 1'),
      ),
      body: CustomPaint(
        painter: _ShapePainter(
          sides: 4,
          radius: 100,
        ),
        child: Container(),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {

  final double radius;
  final int sides;

  _ShapePainter({
    required this.radius,
    required this.sides,
  });

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    final path = Path();
    
    final angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);

    // startPoint => (100.0, 0.0)
    Offset startPoint = Offset(radius * math.cos(0.0) , radius * math.sin(0.0));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for(int i = 1; i <= sides; i++) {
      final double x = radius * math.cos(angle * i) + center.dx;
      final double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
