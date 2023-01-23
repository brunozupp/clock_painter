import 'package:flutter/material.dart';
    
class CircleExampleOnePage extends StatelessWidget {

  const CircleExampleOnePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Example 1'),
      ),
      body: CustomPaint(
        painter: _ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}