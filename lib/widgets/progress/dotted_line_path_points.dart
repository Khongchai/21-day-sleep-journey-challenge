import 'dart:math';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:yawwn/utils/html_dotted_line.dart';

class DottedLinePathPoints extends CustomPainter {
  static final startLine1 = GlobalKey();
  static final startLine2 = GlobalKey();
  static final startLine3 = GlobalKey();
  static final startLine4 = GlobalKey();
  static final startLine5 = GlobalKey();
  static final startLine6 = GlobalKey();
  static final endLine1 = GlobalKey();
  static final endLine2 = GlobalKey();
  static final endLine3 = GlobalKey();
  static final endLine4 = GlobalKey();
  static final endLine5 = GlobalKey();
  static final endLine6 = GlobalKey();

  @override
  void paint(Canvas canvas, Size size) {
    final firstLineBegin = getPositionOfObject(startLine1);
    final firstLineEnd = getPositionOfObject(endLine1);
    final secondLineBegin = getPositionOfObject(startLine2);
    final secondLineEnd = getPositionOfObject(endLine2);
    final thirdLineBegin = getPositionOfObject(startLine3);
    final thirdLineEnd = getPositionOfObject(endLine3);
    final fourthLineBegin = getPositionOfObject(startLine4);
    final fourthLineEnd = getPositionOfObject(endLine4);
    final fifthLineBegin = getPositionOfObject(startLine5);
    final fifthLineEnd = getPositionOfObject(endLine5);
    final sixthLineBegin = getPositionOfObject(startLine6);
    final sixthLineEnd = getPositionOfObject(endLine6);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color(0xffffffff);
    const lines = [5.0, 5.0];
    setLineDash(canvas, firstLineBegin, firstLineEnd, paint, lines);
    setLineDash(canvas, secondLineBegin, secondLineEnd, paint, lines);
    setLineDash(canvas, thirdLineBegin, thirdLineEnd, paint, lines);
    setLineDash(canvas, fourthLineBegin, fourthLineEnd, paint, lines);
    setLineDash(canvas, fifthLineBegin, fifthLineEnd, paint, lines);
    setLineDash(canvas, sixthLineBegin, sixthLineEnd, paint, lines);

    double arcsCenterX = firstLineEnd.dx;
    double firstArcCenterY =
        firstLineEnd.dy + (secondLineEnd.dy - firstLineEnd.dy) / 2;
    setArcDash(
        canvas, arcsCenterX, firstArcCenterY, 80, paint, 270, 360 + 90, lines);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Offset getPositionOfObject(GlobalKey objectKey) {
    RenderBox box = objectKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    Size size = box.size;

    Offset correctedPosition =
        Offset(position.dx + size.width / 2, position.dy + size.height / 4);

    return correctedPosition;
  }
}

/*
  Angles should be in degrees
 */
void setArcDash(Canvas canvas, double centerX, double centerY, double radius,
    Paint paint, double beginAngle, double endAngle, List<double> segments,
    [bool useCenter = false]) {
  /*
      when array has even length
      [5, 15] => [0, 15]
      when array has odd length
      [5, 15, 16] => [5, 15, 16, 5, 15, 16]
     */
  final _segments =
      segments.length % 2 == 0 ? segments : [...segments, ...segments];
  final generator = _GenOnDemand(_segments);

  final trueCenterX = centerX - radius / 2;
  final trueCenterY = centerY - radius / 2;
  double _curAngle = beginAngle;
  double _lastAngle = beginAngle;
  double _sweepAmount = 0;
  int i = 0;

  bool doneOnce = false;
  do {
    // Draw arc line every other iteration;
    if (i % 2 != 0 && !doneOnce) {
      double cur = _curAngle * (pi / 180);
      double sweep = _sweepAmount * (pi / 180);
      canvas.drawArc(Offset(trueCenterX, trueCenterY) & Size(radius, radius),
          cur, sweep, useCenter, paint);
    }

    i++;
    _lastAngle = _curAngle;
    _curAngle += generator.next();
    _sweepAmount = (_curAngle - _lastAngle.abs());
  } while (_curAngle + _sweepAmount < endAngle);
}

//next() function acts like javascript generator's next()
class _GenOnDemand {
  int i = 0;
  List<double> array;
  _GenOnDemand(this.array);

  double next() {
    double num = array[i];
    i = (i + 1) % array.length;
    return num;
  }
}
