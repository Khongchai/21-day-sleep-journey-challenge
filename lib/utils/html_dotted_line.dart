import "dart:math";
import "dart:ui";

import 'inverse_lerp.dart';

void setLineDash(
    Canvas canvas, Offset p1, Offset p2, Paint paint, List<double> segments) {
  final diffX = (p1.dx - p2.dx).abs();
  final diffY = (p1.dy - p2.dy).abs();
  final distance = sqrt(pow(diffX, 2) + pow(diffY, 2));

  /*
      when array has even length
      [5, 15] => [0, 15]
      when array has odd length
      [5, 15, 16] => [5, 15, 16, 5, 15, 16]
     */
  final _segments =
      segments.length % 2 == 0 ? segments : [...segments, ...segments];
  final generator = _GenOnDemand(_segments);

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
