import 'package:flutter/material.dart';

class CcCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final secondCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy);

    final thirdCurve = Offset(0, size.height - 20);
    final fourthCurve = Offset(size.width - 30, size.height - 20);

    path.quadraticBezierTo(
        thirdCurve.dx, thirdCurve.dy, fourthCurve.dx, fourthCurve.dy);

    final fifthCurve = Offset(size.width, size.height - 20);
    final sixthCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(
        fifthCurve.dx, fifthCurve.dy, sixthCurve.dx, sixthCurve.dy);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path?> oldClipper) {
    return true;
  }
}
