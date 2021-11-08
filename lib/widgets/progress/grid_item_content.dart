import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'disabled_box.dart';

class GridItemContent extends StatelessWidget {
  final String? text;
  final String? svgImagePath;
  final bool activated;
  final BorderRadius borderRadius;
  final Color cardColor;
  const GridItemContent(
      {required this.borderRadius,
      required this.cardColor,
      required this.activated,
      required this.svgImagePath,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: text != null
                ? Text(text!.toUpperCase(),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: const TextStyle(letterSpacing: 1.5, fontSize: 13))
                : SvgPicture.asset(svgImagePath!)),
        activated
            ? const SizedBox()
            : DisabledOverlayBox(color: cardColor, borderRadius: borderRadius),
      ],
    );
  }
}
