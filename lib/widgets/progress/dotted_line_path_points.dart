import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class DottedLinePathPoints extends CustomPainter {
  final startLine1 = GlobalKey();
  final startLine2 = GlobalKey();
  final startLine3 = GlobalKey();
  final startLine4 = GlobalKey();
  final startLine5 = GlobalKey();
  final startLine6 = GlobalKey();
  final endLine1 = GlobalKey();
  final endLine2 = GlobalKey();
  final endLine3 = GlobalKey();
  final endLine4 = GlobalKey();
  final endLine5 = GlobalKey();
  final endLine6 = GlobalKey();

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
    canvas.drawLine(firstLineBegin, firstLineEnd, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //TODO => implement paint
    return false;
  }

  Offset getPositionOfObject(GlobalKey objectKey) {
    RenderBox box = objectKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    Offset correctedPosition = Offset(position.dx, position.dy);

    return correctedPosition;
  }
}
