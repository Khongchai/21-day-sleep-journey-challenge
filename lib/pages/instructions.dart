import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yawwn/global_state/user_related_state.dart';
import 'package:yawwn/pages/progress.dart';
import 'package:yawwn/utils/show_two_buttons_dialog.dart';
import 'package:yawwn/widgets/background_decorations/mask_and_clouds.dart';
import 'package:yawwn/widgets/bottom_navigation_buttons.dart';
import 'package:yawwn/widgets/instructions/instruction_text.dart';
import 'package:yawwn/widgets/stack_container.dart';

class Instructions extends StatelessWidget {
  static const route = "instruction";

  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledStackContainer(children: [
        const MaskAndClouds(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                flex: 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome to 21 DAYS",
                          style: Theme.of(context).textTheme.headline1),
                      const SizedBox(height: 5),
                      Text("Sleep Journey Challenge",
                          style: Theme.of(context).textTheme.headline1),
                    ])),
            Flexible(
              flex: 6,
              child: Column(children: [
                Text("Instructions",
                    style: Theme.of(context).textTheme.bodyText1),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 30),
                      InstructionText(
                          "Get your sleep mask ready and prepare yourself for an awesome and relaxing night! "),
                      SizedBox(height: 10),
                      InstructionText(
                          "We will be using the 4-7-8 technique to calm the body. More will be explained later."),
                    ])
              ]),
            )
          ],
        ),
        Consumer<UserRelatedState>(
            builder: (context, authState, _) => BottomNavigationButtons(
                backwardOnPressed: () {
                  showTwoButtonsDialog(
                    context,
                    () => Navigator.of(context).pop(),
                    () => authState.signOut(context),
                  );
                },
                goBackwardText: "Maybe Later",
                goForwardText: "Let's go!",
                forwardOnPressed: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const Progress(),
                        transitionDuration: Duration.zero,
                      ),
                    ))),
      ]),
    );
  }
}
