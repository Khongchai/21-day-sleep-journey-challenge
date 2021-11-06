import "package:flutter/material.dart";
import 'package:yawwn/widgets/progress/dotted_line_path_points.dart';

import 'grid_item.dart';

class ProgressUI extends StatefulWidget {
  const ProgressUI({Key? key}) : super(key: key);

  @override
  _ProgressUIState createState() => _ProgressUIState();
}

class _ProgressUIState extends State<ProgressUI> {
  static const assetPath = "assets/decor/";

  @override
  Widget build(BuildContext context) {
    final dottedLinePathPoints = DottedLinePathPoints();

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: CustomPaint(
            painter: dottedLinePathPoints,
            child: Container(),
          ),
        ),
        GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              Center(
                  child: const Text("Start"),
                  key: dottedLinePathPoints.startLine1),
              const GridItem(text: "Day 1"),
              const GridItem(
                svgImagePath: assetPath + "moon-stars.svg",
              ),
              GridItem(
                  svgImagePath: assetPath + "rainbow.svg",
                  key: dottedLinePathPoints.endLine1),
              GridItem(text: "Day 7", key: dottedLinePathPoints.startLine2),
              const GridItem(svgImagePath: assetPath + "sheep.svg"),
              const GridItem(svgImagePath: assetPath + "star-rainbow.svg"),
              GridItem(
                  svgImagePath: assetPath + "cloud-falling-stars.svg",
                  key: dottedLinePathPoints.endLine2),
              GridItem(
                  svgImagePath: assetPath + "zzz.svg",
                  key: dottedLinePathPoints.startLine3),
              const GridItem(svgImagePath: assetPath + "sleep-mask.svg"),
              const GridItem(svgImagePath: assetPath + "clouds.svg"),
              GridItem(
                  svgImagePath: assetPath + "star.svg",
                  key: dottedLinePathPoints.endLine3),
              GridItem(
                  svgImagePath: assetPath + "wecker.svg",
                  key: dottedLinePathPoints.startLine4),
              const GridItem(text: "Day 14"),
              const GridItem(svgImagePath: assetPath + "rainbow2.svg"),
              GridItem(
                  svgImagePath: assetPath + "cloud-falling-stars.svg",
                  key: dottedLinePathPoints.endLine4),
              GridItem(
                  svgImagePath: assetPath + "sheep.svg",
                  key: dottedLinePathPoints.startLine5),
              const GridItem(svgImagePath: assetPath + "star-rainbow2.svg"),
              const GridItem(svgImagePath: assetPath + "sleeping-hat.svg"),
              GridItem(
                  svgImagePath: assetPath + "sheep.svg",
                  key: dottedLinePathPoints.endLine5),
              const Center(child: Text("tap")),
              GiftBox(
                  assetPath: assetPath, key: dottedLinePathPoints.startLine6),
              const GridItem(text: "Day 21"),
              GridItem(
                  svgImagePath: assetPath + "moon-stars.svg",
                  key: dottedLinePathPoints.endLine6),
            ]),
      ],
    );
  }
}

class GiftBox extends StatelessWidget {
  final String assetPath;
  const GiftBox({required this.assetPath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            right: 0,
            top: 0,
            left: 0,
            child: Image.asset(assetPath + "radial-gradient-background.png")),
        Positioned(
            bottom: 0,
            right: 0,
            top: 0,
            left: 0,
            child: Image.asset(assetPath + "gift-box.png")),
      ],
    );
  }
}
