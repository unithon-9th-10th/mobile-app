import 'package:flutter/material.dart';

/// https://stackoverflow.com/a/52948539
class PointPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final point = TextPainter(
      text: const TextSpan(
        text: '-',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    point.layout(maxWidth: size.width);

    for (double i = 0; i < size.width; i += point.width) {
      point.paint(canvas, Offset(i, .0));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
