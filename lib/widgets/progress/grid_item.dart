import "package:flutter/material.dart";
import 'package:yawwn/pages/daily_instructions.dart';

import 'grid_item_content.dart';

class GridItem extends StatelessWidget {
  final String? text;
  final String? svgImagePath;
  //isCurrent = true means the user is currently here
  final int itemPosition;
  final int curDay;

  const GridItem(
      {required this.curDay,
      this.svgImagePath,
      this.text,
      required this.itemPosition,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    const cardColor = Color(0xff504098);
    final isCurrent = itemPosition == curDay;
    final activated = itemPosition <= curDay;

    return GestureDetector(
      onTap: isCurrent
          ? () => Navigator.pushNamed(context, DailyInstructions.screenName,
              arguments: {"selectedDay": itemPosition})
          : null,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        color: cardColor,
        elevation: activated ? 5 : 0,
        child: Container(
          decoration: isCurrent
              ? BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                )
              : null,
          child: GridItemContent(
            cardColor: cardColor,
            borderRadius: borderRadius,
            activated: activated,
            svgImagePath: svgImagePath,
            text: text,
          ),
        ),
      ),
    );
  }
}
