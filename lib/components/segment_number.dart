import 'package:flutter/material.dart';

class SegmentNumber extends CustomPainter {
  final int number;
  static const Map<int, List<int>> positionPathNumber = {
    0: [1, 2, 3, 0, 5, 6, 7],
    1: [2, 5],
    2: [1, 2, 4, 7, 6],
    3: [1, 2, 4, 5, 6],
    4: [3, 4, 2, 5],
    5: [1, 3, 4, 5, 6],
    6: [1, 3, 4, 7, 6, 5],
    7: [1, 2, 5],
    8: [1, 2, 3, 4, 5, 6, 7],
    9: [3, 1, 2, 4, 5, 6],
    -1: [],
  };

  SegmentNumber(this.number);

  @override
  void paint(Canvas canvas, Size size) {
    // 52 x 96
    double h = size.height;
    double w = size.width;
    Paint paintOn = Paint()..color = Color(0xFF171717);
    Paint paintOff = Paint()..color = Color(0xFFE6E6E6);
    Path path1 = Path()
      ..moveTo(0.01*w, 0)
      ..lineTo(w, 0)
      ..lineTo(0.8 * w, h / 12)
      ..lineTo(0.154 * w, h / 12)
      ..close();

    Path path2 = Path()
      ..moveTo(w, 0.021 * h)
      ..lineTo(w, 0.49 * h)
      ..lineTo(0.845 * w, 0.4375 * h)
      ..lineTo(0.846 * w, 0.1 * h)
      ..close();
    Path path3 = Path()
      ..moveTo(0, 0.021 * h)
      ..lineTo(0.154 * w, 0.1 * h)
      ..lineTo(0.154 * w, 0.4375 * h)
      ..lineTo(0, 0.49 * h)
      ..close();

    Path path4 = Path()
      ..moveTo(0.154 * w, 0.458 * h)
      ..lineTo(0.846 * w, 0.458 * h)
      ..lineTo(w, 0.5 * h)
      ..lineTo(0.846 * w, 0.542 * h)
      ..lineTo(0.154 * w, 0.542 * h)
      ..lineTo(0.029 * w, 0.5 * h)
      ..close();

    Path path5 = Path()
      ..moveTo(w, 0.516 * h) // 49.5 / 96 ~ 0.516
      ..lineTo(w, 0.99 * h) // 95 / 96 ~ 0.99
      ..lineTo(0.846 * w, 0.906 * h) // 44 / 52 ~ 0.846, 87/96~0.906
      ..lineTo(0.846 * w, 0.562 * h) // 44 / 52 ~ 0.846, 54/96~0.562
      ..close();

    // Path6: Bottom horizontal
    Path path6 = Path()
      ..moveTo(0.962 * w, h) // 50/52 ~0.962
      ..lineTo(0.038 * w, h) // 2 /52 ~0.038
      ..lineTo(0.183 * w, 0.917 * h) // 9.5/52~0.183, 88/96~0.917
      ..lineTo(0.817 * w, 0.917 * h) // 42.5/52~0.817
      ..close();

    // Path7: Bottom-left vertical
    Path path7 = Path()
      ..moveTo(0.154 * w, 0.906 * h) // 8/52 ~0.154, 87/96~0.906
      ..lineTo(0.154 * w, 0.562 * h) // 54/96 ~0.562
      ..lineTo(0, 0.510 * h) // 49/96~0.510
      ..lineTo(0, 0.99 * h) // 95/96 ~0.99
      ..close();

    List<Path> segments = [path1, path2, path3, path4, path5, path6, path7];
    final active = positionPathNumber[number] ?? [];
    for (int i = 0; i < segments.length; i++) {
      canvas.save();
      canvas.drawPath(segments[i], active.contains(i + 1) ? paintOn : paintOff);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant SegmentNumber oldDelegate) {
    return oldDelegate.number != number;
  }
}
