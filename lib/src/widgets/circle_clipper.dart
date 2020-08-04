import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width * 0.45),
      );
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) => false;
}
