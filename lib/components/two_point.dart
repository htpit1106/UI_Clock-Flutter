import 'package:flutter/material.dart';

class TwoPoint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    // Vẽ 2 chấm theo tỉ lệ
    double w = size.width;
    double h = size.height;

    double dotWidth = w * 0.8;
    double dotHeight = h * 0.08;

    double left = (w - dotWidth) / 2;
    double top1 = h * 0.35;
    double top2 = h * 0.65;

    // Vẽ chấm trên
    final rect1 = Rect.fromLTWH(left, top1, dotWidth, dotHeight);
    canvas.drawRect(rect1, paint);

    // Vẽ chấm dưới
    final rect2 = Rect.fromLTWH(left, top2, dotWidth, dotHeight);
    canvas.drawRect(rect2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
