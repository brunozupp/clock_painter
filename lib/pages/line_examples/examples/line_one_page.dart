import 'package:flutter/material.dart';
    
class LineOnePage extends StatelessWidget {

  const LineOnePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lines Example 1'),
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
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}