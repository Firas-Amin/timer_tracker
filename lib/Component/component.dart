import 'package:flutter/material.dart';
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {



    double x = 150, y = 45, r = 0.5;
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(rect))
      ..moveTo(rect.bottomRight.dx - 30, rect.bottomCenter.dy)
      ..relativeQuadraticBezierTo(((-x / 2)+(x/6)) * (1 - r), 0, -x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(-x / 6 * r, y * (1 - r), -x / 2 * (1 - r), y * (1 - r))
      ..relativeQuadraticBezierTo(((-x / 2)+(x/6)) * (1 - r), 0, -x / 2 * (1 - r), -y * (1 - r))
      ..relativeQuadraticBezierTo(-x/6*r , -y * r, -x / 2 * r, -y * r);

    return path;
  }
}
