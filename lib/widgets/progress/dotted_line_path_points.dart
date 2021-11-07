import 'dart:math';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

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
      ..strokeWidth = 2
      ..color = const Color(0xffffffff);
    const lines = [5.0, 5.0];
    setLinedash(canvas, firstLineBegin, firstLineEnd, paint, lines);
    setLinedash(canvas, secondLineBegin, secondLineEnd, paint, lines);
    setLinedash(canvas, thirdLineBegin, thirdLineEnd, paint, lines);
    setLinedash(canvas, fourthLineBegin, fourthLineEnd, paint, lines);
    setLinedash(canvas, fifthLineBegin, fifthLineEnd, paint, lines);
    setLinedash(canvas, sixthLineBegin, sixthLineEnd, paint, lines);
    //TODO => draw arcs
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

void setLinedash(
    Canvas canvas, Offset p1, Offset p2, Paint paint, List<double> segments) {
  final diffX = (p1.dx - p2.dx).abs();
  final diffY = (p1.dy - p2.dy).abs();
  final distance = sqrt(pow(diffX, 2) + pow(diffY, 2));

  /*
      [5, 15] => [0, 15] even length
      [5, 15, 16] => [5, 15, 16, 5, 15, 16] odd length
     */
  final _segments =
      segments.length % 2 == 0 ? segments : [...segments, ...segments];
  final generator = GenOnDemand(_segments);

  int i = 0;
  double beginX = 0;
  double beginY = 0;
  double endX = 0;
  double endY = 0;
  double curPos = 0;
  double lastPos = 0;
  do {
    if (curPos > distance) break;

    //print line every other iteration
    if (i % 2 != 0) {
      double beginWeight = inverseLerp(0, distance, lastPos);
      double endWeight = inverseLerp(0, distance, curPos);

      beginX = p1.dx + diffX * beginWeight;
      beginY = p1.dy + diffY * beginWeight;
      endX = p1.dx + diffX * endWeight;
      endY = p1.dy + diffY * endWeight;

      canvas.drawLine(Offset(beginX, beginY), Offset(endX, endY), paint);
    }

    i++;
    lastPos = curPos;
    curPos += generator.next();
  } while (curPos < distance);
}

double inverseLerp(double x, double y, double value) {
  return (value - x) / (y - x);
}

//next() function acts like javascript generator's next()
class GenOnDemand {
  int i = 0;
  List<double> array;
  GenOnDemand(this.array);

  double next() {
    double num = array[i];
    i = (i + 1) % array.length;
    return num;
  }
}
