import "package:flutter/material.dart";

class DisabledOverlayBox extends StatelessWidget {
  final BorderRadius borderRadius;
  final Color color;

  const DisabledOverlayBox(
      {required this.color, required this.borderRadius, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: const Color(0xff504098),
        ),
        child: SizedBox(
          width: 1 / 0,
          height: 1 / 0,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.color),
          ),
        ),
      ),
    );
  }
}
