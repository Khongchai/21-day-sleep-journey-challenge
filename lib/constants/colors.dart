import "package:flutter/material.dart";

class Colors {
  Color primary;
  Color accent;
  Color background;
  Color warning;
  Color violet;
  Color softPurple;

  Colors(this.primary, this.accent, this.background, this.warning, this.violet,
      this.softPurple);
}

final appColors = Colors(
    const Color(0xff084fff),
    const Color(0xfffecd00),
    const Color(0xff291467),
    const Color(0xffff0000),
    const Color(0xff6150FF),
    const Color(0xff504098));
