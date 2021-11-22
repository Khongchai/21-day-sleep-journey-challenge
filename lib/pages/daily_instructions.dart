import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yawwn/global_state/user_related_state.dart';
import 'package:yawwn/widgets/background_decorations/sleeping_guy_under_the_stars.dart';
import 'package:yawwn/widgets/daily_instructions/check_button.dart';
import 'package:yawwn/widgets/daily_instructions/complete_text.dart';
import 'package:yawwn/widgets/daily_instructions/step.dart';
import 'package:yawwn/widgets/stack_container.dart';

class CheckboxState {
  bool firstBoxChecked;
  bool secondBoxChecked;

  CheckboxState(
      {required this.firstBoxChecked, required this.secondBoxChecked});

  bool bothChecked() => firstBoxChecked && secondBoxChecked;
}

class DailyInstructions extends StatefulWidget {
  static const route = "daily_instructions";

  const DailyInstructions({Key? key}) : super(key: key);

  @override
  State<DailyInstructions> createState() => _DailyInstructionsState();
}

class _DailyInstructionsState extends State<DailyInstructions> {
  final CheckboxState checkboxState =
      CheckboxState(firstBoxChecked: false, secondBoxChecked: false);
  static const textColor = Color(0xffB0ABC7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserRelatedState>(
        builder: (context, appState, child) {
          /*
          Internally, days start from 0.
          Days start from one only on the UI.

          Compares the day passed on from previous page to the user's progress
        */
          final userDayProgress = appState.userDayProgress;
          final selectedDay = (ModalRoute.of(context)!.settings.arguments!
              as Map)["selectedDay"] as int;

          final onCheckPressed = selectedDay == userDayProgress
              ? () => appState.userDayProgress += 1
              : () {};

          final dayFinished = userDayProgress > selectedDay;

          return StyledStackContainer(withGradient: true, children: [
            Column(children: [
              const SleepingGuyUnderTheStars(),
              SizedBox(
                  child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("DAY ${selectedDay + 1}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 30)),
                    const SizedBox(width: 10),
                    dayFinished ? const CompleteText() : const SizedBox(),
                  ],
                ),
              )),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text("Time to relax, follow the instruction",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: textColor)),
                      const SizedBox(height: 20),
                      const SizedBox(height: 10),
                      InstructionStep(
                          disabled: dayFinished,
                          content: "Put on your sleep mask",
                          textColor: textColor,
                          checkboxState: checkboxState.firstBoxChecked,
                          onChanged: (val) {
                            setState(() {
                              checkboxState.firstBoxChecked = val;
                            });
                          },
                          step: 1),
                      InstructionStep(
                          disabled: dayFinished,
                          content:
                              "Perform the breathing exercises: 4-7-8 by emptying your lung, and then inhale for 1- 4 seconds, hold and count to 1-7 and exhale through your mouth for 1-8 seconds. Repeat 4 times. ",
                          textColor: textColor,
                          checkboxState: checkboxState.secondBoxChecked,
                          onChanged: (val) {
                            setState(() {
                              checkboxState.secondBoxChecked = val;
                            });
                          },
                          step: 2),
                      const SizedBox(height: 10),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xff232274),
                      borderRadius: BorderRadius.circular(10.0))),
            ]),
            Positioned(
              right: 0,
              bottom: 0,
              child: CheckButton(
                  dayFinished: dayFinished,
                  enabled: checkboxState.bothChecked(),
                  onPressed: onCheckPressed),
            ),
            Positioned(
                left: 0,
                bottom: 0,
                child: IconButton(
                    onPressed: Navigator.of(context).pop,
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back)))
          ]);
        },
      ),
    );
  }
}
