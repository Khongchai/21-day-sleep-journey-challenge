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
    return Stack(
      children: [
        GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              Center(
                  child: const Text("Start"),
                  key: DottedLinePathPoints.startLine1),
              const GridItem(text: "Day 1", position: 0),
              const GridItem(
                  svgImagePath: assetPath + "moon-stars.svg", position: 1),
              GridItem(
                  svgImagePath: assetPath + "rainbow.svg",
                  position: 2,
                  key: DottedLinePathPoints.endLine1),
              GridItem(
                  text: "Day 7",
                  key: DottedLinePathPoints.startLine2,
                  position: 6),
              const GridItem(
                  svgImagePath: assetPath + "sheep.svg", position: 5),
              const GridItem(
                  svgImagePath: assetPath + "star-rainbow.svg", position: 3),
              GridItem(
                  position: 6,
                  svgImagePath: assetPath + "cloud-falling-stars.svg",
                  key: DottedLinePathPoints.endLine2),
              GridItem(
                  position: 7,
                  svgImagePath: assetPath + "zzz.svg",
                  key: DottedLinePathPoints.startLine3),
              const GridItem(
                  position: 8, svgImagePath: assetPath + "sleep-mask.svg"),
              const GridItem(
                  position: 9, svgImagePath: assetPath + "clouds.svg"),
              GridItem(
                  position: 13,
                  svgImagePath: assetPath + "star.svg",
                  key: DottedLinePathPoints.endLine3),
              GridItem(
                  position: 12,
                  svgImagePath: assetPath + "wecker.svg",
                  key: DottedLinePathPoints.startLine4),
              const GridItem(position: 11, text: "Day 14"),
              const GridItem(
                  position: 10, svgImagePath: assetPath + "rainbow2.svg"),
              GridItem(
                  position: 14,
                  svgImagePath: assetPath + "cloud-falling-stars.svg",
                  key: DottedLinePathPoints.endLine4),
              GridItem(
                  position: 15,
                  svgImagePath: assetPath + "sheep.svg",
                  key: DottedLinePathPoints.startLine5),
              const GridItem(
                  position: 16, svgImagePath: assetPath + "star-rainbow2.svg"),
              const GridItem(
                  position: 17, svgImagePath: assetPath + "sleeping-hat.svg"),
              GridItem(
                  position: 18,
                  svgImagePath: assetPath + "sheep.svg",
                  key: DottedLinePathPoints.endLine5),
              const Center(child: Text("tap")),
              GiftBox(
                  assetPath: assetPath, key: DottedLinePathPoints.startLine6),
              const GridItem(text: "Day 21", position: 21),
              GridItem(
                  position: 20,
                  svgImagePath: assetPath + "moon-stars.svg",
                  key: DottedLinePathPoints.endLine6),
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
