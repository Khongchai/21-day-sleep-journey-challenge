import "package:flutter/material.dart";
import 'package:yawwn/widgets/background_decorations/background_container.dart';

class MoonAndStarsBackground extends StatelessWidget {
  const MoonAndStarsBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BackgroundContainer(
      children: [
        Positioned(
            top: screenHeight * 0.05,
            child: Image.asset("assets/background1/stars1.png")),
        Positioned(
          top: screenHeight * 0.05,
          child: Image.asset("assets/background1/background.png"),
        ),
        Positioned(
          top: screenHeight * 0.05,
          right: 10,
          child: Image.asset("assets/background1/comets.png"),
        )
      ],
    );
  }
}
