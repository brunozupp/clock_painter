import 'package:flutter/material.dart';
    
class LineFivePage extends StatelessWidget {

  const LineFivePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lines Example 5'),
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

    drawTelhado(
      canvas: canvas,
      size: size,
    );

    drawCasa(
      canvas: canvas,
      size: size,
    );
    
    drawJanela(
      canvas: canvas,
      size: size,
    );

    drawPorta(
      canvas: canvas,
      size: size,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawTelhado({
    required Canvas canvas,
    required Size size,
  }) {

    final paint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Traço esquerdo
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.1), 
      Offset(size.width * 0.1, size.height * 0.3), 
      paint,
    );

    // Traço direito
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.1), 
      Offset(size.width * 0.9, size.height * 0.3), 
      paint,
    );

    // Traço debaixo
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.3), 
      Offset(size.width * 0.9, size.height * 0.3), 
      paint,
    );
  }

  void drawCasa({
    required Canvas canvas,
    required Size size,
  }) {

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.3);
    path.lineTo(size.width * 0.1, size.height * 0.8);
    path.lineTo(size.width * 0.9, size.height * 0.8);
    path.lineTo(size.width * 0.9, size.height * 0.3);
    path.lineTo(size.width * 0.1, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  void drawJanela({
    required Canvas canvas,
    required Size size,
  }) {

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.65, size.height * 0.4);
    path.lineTo(size.width * 0.65, size.height * 0.5);
    path.lineTo(size.width * 0.85, size.height * 0.5);
    path.lineTo(size.width * 0.85, size.height * 0.4);
    path.lineTo(size.width * 0.65, size.height * 0.4);

    canvas.drawPath(path, paint);

    canvas.drawLine(
      Offset(size.width * 0.75, size.height * 0.4), 
      Offset(size.width * 0.75, size.height * 0.5),
      paint,
    );
  }

  void drawPorta({
    required Canvas canvas,
    required Size size,
  }) {

    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height * 0.8);

    canvas.drawPath(path, paint);
  }
}