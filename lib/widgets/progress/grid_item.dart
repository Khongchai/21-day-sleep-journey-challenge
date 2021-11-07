import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class GridItem extends StatelessWidget {
  final String? text;
  final String? svgImagePath;

  const GridItem({this.svgImagePath, this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xff504098),
      elevation: 5,
      child: Center(
          child: text != null
              ? Text(text!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(letterSpacing: 1.5, fontSize: 13))
              : SvgPicture.asset(svgImagePath!)),
    );
  }
}
