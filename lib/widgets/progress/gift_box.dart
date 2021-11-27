import "package:flutter/material.dart";
import 'package:yawwn/widgets/progress/gift_box/show_gift_box_dialog.dart';

class GiftBox extends StatelessWidget {
  final String assetPath;
  final bool isFinalDay;
  const GiftBox({required this.isFinalDay, required this.assetPath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isFinalDay ? () => showGiftBoxDialog(context) : null,
      child: Stack(
        children: [
          if (isFinalDay)
            Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                left: 0,
                child:
                    Image.asset(assetPath + "radial-gradient-background.png")),
          Positioned(
              bottom: 0,
              right: 0,
              top: 0,
              left: 0,
              child: Opacity(
                  opacity: isFinalDay ? 1 : 0.5,
                  child: Image.asset(assetPath + "gift-box.png"))),
        ],
      ),
    );
  }
}
