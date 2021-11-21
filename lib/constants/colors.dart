import "package:flutter/material.dart";

class Colors {
  Color primary;
  Color accent;
  Color background;
  Color warning;

  Colors(this.primary, this.accent, this.background, this.warning);
}

final appColors = Colors(const Color(0xff084fff), const Color(0xfffecd00),
    const Color(0xff291467), const Color(0xffff0000));
