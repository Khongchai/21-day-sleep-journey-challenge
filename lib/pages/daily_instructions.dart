import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yawwn/global_state/app_state.dart';
import 'package:yawwn/widgets/background_decorations/sleeping_guy_under_the_stars.dart';
import 'package:yawwn/widgets/daily_instructions/check_button.dart';
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
      body: StyledStackContainer(children: [
        Column(children: [
          const SleepingGuyUnderTheStars(),
          Consumer<AppState>(
            builder: (context, appState, child) => SizedBox(
                child: Align(
              alignment: Alignment.topLeft,
              child: Text("DAY ${appState.userDayProgress + 1}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 30)),
            )),
          ),
          const SizedBox(height: 10),
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
        CheckButton(enableCondition: checkboxState.bothChecked())
      ]),
    );
  }
}
