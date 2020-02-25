import 'package:flutter/material.dart';
import 'dart:math';

class SpaceParticles extends CustomPainter {
  Paint _paint;
  double height;
  double width;
  int number;

  SpaceParticles(this.height, this.width, this.number) {
    _paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.butt;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random(1);
    List<Color> particleColor = [
      Colors.white,
      Colors.purple,
      Colors.white30,
      Colors.green,
      Colors.blue,
      Colors.blueAccent
    ];

    for (int i = 0; i < number; i++) {
      double x = random.nextDouble() * width;
      double y = random.nextDouble() * height;
      int colorNum = random.nextInt(particleColor.length);

      List<double> particleSizes = [0.004, 0.005, 0.006, 0.007, 0.008];
      int particleSize = random.nextInt(particleSizes.length);

      final position = Offset(x, y);
      canvas.drawCircle(
          position, size.width * particleSizes[particleSize], _paint);
      _paint.color = particleColor[colorNum];
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
