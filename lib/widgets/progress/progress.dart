import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yawwn/global_state/user_related_state.dart';
import 'package:yawwn/widgets/progress/dotted_line_path_points.dart';

import 'gift_box.dart';
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
    return Consumer<UserRelatedState>(builder: (context, appState, child) {
      final curDay = appState.userDayProgress;
      const finalDay = 21;
      final isFinalDay = curDay == finalDay;

      return (GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: [
            Center(
                child: const Text("Start"),
                key: DottedLinePathPoints.startLine1),
            GridItem(text: "Day 1", itemPosition: 0, curDay: curDay),
            GridItem(
                svgImagePath: assetPath + "moon-stars.svg",
                itemPosition: 1,
                curDay: curDay),
            GridItem(
                svgImagePath: assetPath + "rainbow.svg",
                itemPosition: 2,
                key: DottedLinePathPoints.endLine1,
                curDay: curDay),
            GridItem(
                text: "Day 7",
                key: DottedLinePathPoints.startLine2,
                itemPosition: 6,
                curDay: curDay),
            GridItem(
                svgImagePath: assetPath + "sheep.svg",
                itemPosition: 5,
                curDay: curDay),
            GridItem(
                svgImagePath: assetPath + "star-rainbow.svg",
                itemPosition: 4,
                curDay: curDay),
            GridItem(
                itemPosition: 3,
                svgImagePath: assetPath + "cloud-falling-stars.svg",
                key: DottedLinePathPoints.endLine2,
                curDay: curDay),
            GridItem(
                itemPosition: 7,
                svgImagePath: assetPath + "zzz.svg",
                key: DottedLinePathPoints.startLine3,
                curDay: curDay),
            GridItem(
                itemPosition: 8,
                svgImagePath: assetPath + "sleep-mask.svg",
                curDay: curDay),
            GridItem(
                itemPosition: 9,
                svgImagePath: assetPath + "clouds.svg",
                curDay: curDay),
            GridItem(
                itemPosition: 10,
                svgImagePath: assetPath + "star.svg",
                key: DottedLinePathPoints.endLine3,
                curDay: curDay),
            GridItem(
                itemPosition: 14,
                svgImagePath: assetPath + "wecker.svg",
                key: DottedLinePathPoints.startLine4,
                curDay: curDay),
            GridItem(itemPosition: 13, text: "Day 14", curDay: curDay),
            GridItem(
                itemPosition: 12,
                svgImagePath: assetPath + "rainbow2.svg",
                curDay: curDay),
            GridItem(
                itemPosition: 11,
                svgImagePath: assetPath + "cloud-falling-stars.svg",
                key: DottedLinePathPoints.endLine4,
                curDay: curDay),
            GridItem(
                itemPosition: 15,
                svgImagePath: assetPath + "sheep.svg",
                key: DottedLinePathPoints.startLine5,
                curDay: curDay),
            GridItem(
                itemPosition: 16,
                svgImagePath: assetPath + "star-rainbow2.svg",
                curDay: curDay),
            GridItem(
                itemPosition: 17,
                svgImagePath: assetPath + "sleeping-hat.svg",
                curDay: curDay),
            GridItem(
                itemPosition: 18,
                svgImagePath: assetPath + "sheep.svg",
                key: DottedLinePathPoints.endLine5,
                curDay: curDay),
            Center(
                child: isFinalDay ? const Text("Tap") : const Text("Finish")),
            GiftBox(
                assetPath: assetPath,
                key: DottedLinePathPoints.startLine6,
                isFinalDay: isFinalDay),
            GridItem(
              text: "Day 21",
              itemPosition: 20,
              curDay: curDay,
            ),
            GridItem(
              itemPosition: 19,
              svgImagePath: assetPath + "moon-stars.svg",
              key: DottedLinePathPoints.endLine6,
              curDay: curDay,
            ),
          ]));
    });
  }
}
