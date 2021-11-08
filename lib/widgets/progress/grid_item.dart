import "package:flutter/material.dart";

import 'grid_item_content.dart';

//TODO => call consumer here and compare user position with the position
class GridItem extends StatelessWidget {
  final String? text;
  final String? svgImagePath;
  final bool activated;
  //isCurrent = true means the user is currently here
  final bool isCurrent;
  final int position;

  const GridItem(
      {this.svgImagePath,
      this.text,
      required this.position,
      this.isCurrent = false,
      this.activated = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    const cardColor = Color(0xff504098);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      color: cardColor,
      elevation: activated ? 5 : 0,
      child: Container(
        decoration: isCurrent
            ? BoxDecoration(
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
    );
  }
}
