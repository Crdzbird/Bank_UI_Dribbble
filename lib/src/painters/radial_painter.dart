import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialPainter extends CustomPainter {
  final double progress;
  final Color color;
  final StrokeCap strokeCap;
  final PaintingStyle paintingStyle;
  //final double initialPercentage;
  //final double totalPercentage;

  RadialPainter(
      {this.progress, this.color, this.strokeCap, this.paintingStyle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = color
      ..style = paintingStyle
      ..strokeCap = strokeCap;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    // Rect rect = new Rect.fromCircle(
    //   center: center,
    //   radius: 80.0,
    // );

    var initialPercentage = 10.0;

    //SQUARE WITH PATH
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / size.width, size.height);
    path.lineTo(0, 1);
    canvas.drawPath(path, paint);

    //SQUARE WITH RECT
    /*final left = 0.0;
    final top = 0.0;
    final right = size.width;
    final bottom = size.height;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(rect, paint);*/

    //CIRCULAR PROGRESS
    /*canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
