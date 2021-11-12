import "package:flutter/material.dart";

class InstructionStep extends StatelessWidget {
  final Color textColor;
  final bool checkboxState;
  final int step;
  final String content;
  final void Function(bool val) onChanged;

  const InstructionStep(
      {required this.checkboxState,
      required this.onChanged,
      required this.textColor,
      required this.step,
      required this.content,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("STEP $step:", style: TextStyle(color: textColor)),
        const SizedBox(height: 5),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Transform.translate(
            offset: const Offset(0, -10),
            child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: checkboxState,
                checkColor: Colors.white,
                onChanged: (val) => onChanged(val ?? false)),
          ),
          Expanded(child: Text(content, style: TextStyle(color: textColor)))
        ])
      ],
    );
  }
}
