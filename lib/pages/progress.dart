import "package:flutter/material.dart";
import 'package:yawwn/widgets/background_decorations/moon_and_stars_background.dart';
import 'package:yawwn/widgets/progress/progress.dart';
import 'package:yawwn/widgets/progress/progress_header.dart';
import 'package:yawwn/widgets/stack_container.dart';

class Progress extends StatelessWidget {
  static const route = "progress";

  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledStackContainer(children: [
        const MoonAndStarsBackground(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: 1 / 0,
          child: Column(children: const [
            ProgressHeader(),
            SizedBox(height: 40),
            Flexible(flex: 80, child: ProgressUI())
          ]),
        )
      ]),
    );
  }
}
