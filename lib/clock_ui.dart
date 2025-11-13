import 'dart:async';


import 'package:flutter/material.dart';

import 'components/segment_number.dart';
import 'components/two_point.dart';

class ClockUi extends StatefulWidget {
  final double totalWidth;
  final double totalHeigh;

  const ClockUi({
    super.key,
    required this.totalWidth,
    required this.totalHeigh,
  });

  @override
  State<ClockUi> createState() => _ClockUiState();
}

class _ClockUiState extends State<ClockUi> {
  DateTime now = DateTime.now();
  late Timer timer;

  final double _spacing = 10;
  late final double _numberWidth =
      (widget.totalWidth - 4 * _spacing) / 4 - 2 * _spacing;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => setState(() {
        now = DateTime.now();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    int minute = now.second;
    int hour = now.minute;
    int minute1 = minute > 9 ? minute ~/ 10 : -1;
    int minute2 = minute % 10;
    int hour1 = hour > 9 ? hour ~/ 10 : -1;
    int hour2 = hour % 10;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,

        child: SizedBox(
          width: widget.totalWidth,
          height: widget.totalHeigh,
          child: Row(
            spacing: _spacing,
            children: [
              CustomPaint(
                size: Size(_numberWidth, widget.totalHeigh),
                painter: SegmentNumber(hour1),
              ),
              CustomPaint(
                size: Size(_numberWidth, widget.totalHeigh),
                painter: SegmentNumber(hour2),
              ),
              CustomPaint(
                size: Size(2 * _spacing, widget.totalHeigh),
                painter: TwoPoint(),
              ),
              CustomPaint(
                size: Size(_numberWidth, widget.totalHeigh),
                painter: SegmentNumber(minute1),
              ),
              CustomPaint(
                size: Size(_numberWidth, widget.totalHeigh),
                painter: SegmentNumber(minute2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
