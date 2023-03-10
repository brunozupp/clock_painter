import 'package:flutter/material.dart';
    
class LineFourPage extends StatelessWidget {

  const LineFourPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lines Example 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomPaint(
          painter: _ShapePainter(),
          child: Container(),
        ),
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
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, 0);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}