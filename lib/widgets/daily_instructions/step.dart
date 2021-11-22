import "package:flutter/material.dart";

class InstructionStep extends StatelessWidget {
  final Color textColor;
  final bool checkboxState;
  final int step;
  final String content;
  final bool disabled;
  final void Function(bool val) onChanged;

  const InstructionStep(
      {required this.checkboxState,
      required this.onChanged,
      required this.textColor,
      required this.step,
      required this.content,
      required this.disabled,
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
                activeColor: disabled ? const Color(0xff261D60) : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: checkboxState,
                checkColor: disabled
                    ? const Color(0xff181345)
                    : const Color(0xffffffff),
                onChanged:
                    disabled ? (_) {} : (val) => onChanged(val ?? false)),
          ),
          Expanded(child: Text(content, style: TextStyle(color: textColor)))
        ])
      ],
    );
  }
}
