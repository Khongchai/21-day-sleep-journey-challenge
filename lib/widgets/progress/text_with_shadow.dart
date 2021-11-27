import "package:flutter/material.dart";

class StrokedTextWithShadow extends StatelessWidget {
  final Color color;
  final String text;
  const StrokedTextWithShadow(
      {required this.text, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(shadows: const [
          Shadow(
            offset: Offset(-4, 4),
            color: Color(0xff002673),
          ),
        ], color: color, fontWeight: FontWeight.bold));
  }
}
