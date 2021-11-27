import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:yawwn/widgets/background_decorations/moon_and_stars_background.dart';
import 'package:yawwn/widgets/progress/dotted_line_path_points.dart';
import 'package:yawwn/widgets/progress/progress.dart';
import 'package:yawwn/widgets/progress/progress_header.dart';
import 'package:yawwn/widgets/stack_container.dart';

class Progress extends StatelessWidget {
  static const screenName = "progress";

  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final dottedLinePathPoints = DottedLinePathPoints();

    return Scaffold(
      body: StyledStackContainer(children: [
        Positioned(
          top: 0,
          left: 0,
          child: CustomPaint(
            painter: dottedLinePathPoints,
            child: Container(),
          ),
        ),
        const MoonAndStarsBackground(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: 1 / 0,
          child: Column(children: const [
            Flexible(flex: 30, child: ProgressHeader()),
            Flexible(flex: 70, child: ProgressUI())
          ]),
        )
      ]),
    );
  }
}
