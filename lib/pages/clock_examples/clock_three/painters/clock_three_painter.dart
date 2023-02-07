import 'dart:math';

import 'package:flutter/material.dart';

class ClockThreePainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    // Variáveis do posicionamento do círculo a ser desenhado
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}