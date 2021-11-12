import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

import 'background_container.dart';

class SleepingGuyUnderTheStars extends StatelessWidget {
  const SleepingGuyUnderTheStars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxContainerSize = 220.0;

    return (SizedBox(
        height: maxContainerSize,
        child: BackgroundContainer(children: [
          Container(
            height: maxContainerSize * 0.9,
            width: 1 / 0,
            decoration: const BoxDecoration(color: Color(0xff322575)),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset("assets/background3/sleeping_guy.svg",
                    height: 150)),
          ),
          SvgPicture.asset("assets/background3/sky_bg.svg",
              height: maxContainerSize * 1.3),
        ])));
  }
}
