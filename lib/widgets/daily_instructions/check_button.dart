import 'package:flutter/material.dart';
import 'package:yawwn/constants/colors.dart';

class CheckButton extends StatelessWidget {
  final bool enableCondition;
  const CheckButton({required this.enableCondition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: MaterialStateProperty.all<Color>(appColors.accent),
          ),
          onPressed: enableCondition
              ? () {
                  print("Check tapped");
                }
              : null,
          child: Row(
            children: const [
              Icon(Icons.check),
              Text("Check", style: TextStyle(fontSize: 18)),
            ],
          )),
    );
  }
}
