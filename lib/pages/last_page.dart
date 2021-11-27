import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:yawwn/widgets/background_decorations/moon_and_stars_background.dart';
import 'package:yawwn/widgets/common/bottom_navigation_buttons.dart';
import 'package:yawwn/widgets/common/stack_container.dart';
import 'package:yawwn/widgets/last_page/goodbye_text.dart';

class LastPage extends StatelessWidget {
  static const screenName = "/last_page";
  const LastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledStackContainer(children: [
        const MoonAndStarsBackground(),
        Stack(children: [
          const GoodbyeText(),
          BottomNavigationButtons(
              goForwardText: "Leave the challenge",
              forwardOnPressed: () => SystemNavigator.pop()),
        ]),
      ]),
    );
  }
}
