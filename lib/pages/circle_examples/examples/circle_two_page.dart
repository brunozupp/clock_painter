import 'package:flutter/material.dart';
    
class CircleTwoPage extends StatelessWidget {

  const CircleTwoPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Example 2'),
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

    final path = Path();

    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2), 
      radius: 100,
    ));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}