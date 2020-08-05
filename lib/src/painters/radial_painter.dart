import 'package:flutter/widgets.dart';

class RadialPainter extends CustomPainter {
  final double progressRemoval;
  final Color color;
  final StrokeCap strokeCap;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  RadialPainter({
    this.progressRemoval,
    this.color,
    this.strokeWidth,
    this.strokeCap,
    this.paintingStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = paintingStyle
      ..strokeCap = strokeCap;

    var progressRemoval = 0.50;

    var path = Path();

    //LINEA SUPERIOR DEL CUADRADO
    path.moveTo((size.width * 0.30), 0);
    path.quadraticBezierTo((size.width * 0.30), 0, size.width, 0);

    //LATERAL DERECHO
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(size.width, 0, size.width, size.height);

    //LINEA INFERIOR DEL CUADRADO
    path.moveTo(size.width, size.height);
    path.quadraticBezierTo(size.width, size.height, 0, size.height);

    //LINEA IZQUIERDA
    path.moveTo(0, size.height);
    path.quadraticBezierTo(0, (size.height * 0.75), 0, ((size.height * 0.75)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
