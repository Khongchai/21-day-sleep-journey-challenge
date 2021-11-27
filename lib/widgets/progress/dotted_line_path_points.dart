import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:yawwn/utils/dotted_arc.dart';
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
  static int yScrolledOffset = 0;
  //Get only size of 1 box for reference
  Size? sizeOfBox;

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
      ..color = const Color(0xbbffffff);
    const lines = [5.0, 5.0];
    setLineDash(canvas, firstLineBegin, firstLineEnd, paint, lines);
    setLineDash(canvas, secondLineBegin, secondLineEnd, paint, lines);
    setLineDash(canvas, thirdLineBegin, thirdLineEnd, paint, lines);
    setLineDash(canvas, fourthLineBegin, fourthLineEnd, paint, lines);
    setLineDash(canvas, fifthLineBegin, fifthLineEnd, paint, lines);
    setLineDash(canvas, sixthLineBegin, sixthLineEnd, paint, lines);

    final radiusY = (secondLineEnd.dy - firstLineEnd.dy);
    final radiusX = radiusY * 0.85;

    //TODO => refactor to dry

    //right side
    double rightArcCenterX = firstLineEnd.dx;

    double firstArcCenterY = firstLineEnd.dy + radiusY / 2;
    setArcDash(canvas, rightArcCenterX, firstArcCenterY, radiusX, radiusY,
        paint, 270, 360 + 90, [7.8, 7.8]);
    double thirdArcCenterY =
        firstArcCenterY + thirdLineEnd.dy - firstLineEnd.dy;
    setArcDash(canvas, rightArcCenterX, thirdArcCenterY, radiusX, radiusY,
        paint, 270, 360 + 90, [7.8, 7.8]);
    double fifthArcCenterY =
        thirdArcCenterY + fifthLineEnd.dy - thirdLineEnd.dy;
    setArcDash(canvas, rightArcCenterX, fifthArcCenterY, radiusX, radiusY,
        paint, 270, 360 + 90, [7.8, 7.8]);

    //left side
    double leftArcCenterX = firstLineBegin.dx - sizeOfBox!.width / 1.5;
    double secondArcCenterY = secondLineEnd.dy + radiusY / 2;
    setArcDash(canvas, leftArcCenterX, secondArcCenterY, radiusX, radiusY,
        paint, 90, 270, [7.8, 7.8]);
    double fourthArcCenter = fourthLineEnd.dy + radiusY / 2;
    setArcDash(canvas, leftArcCenterX, fourthArcCenter, radiusX, radiusY, paint,
        90, 270, [7.8, 7.8]);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Offset getPositionOfObject(GlobalKey objectKey) {
    RenderBox box = objectKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    Size size = box.size;
    sizeOfBox ??= size;

    Offset correctedPosition =
        Offset(position.dx + size.width / 2, position.dy + size.height / 4);

    return correctedPosition;
  }
}
