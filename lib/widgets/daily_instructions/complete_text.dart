import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';

class CompleteText extends StatelessWidget {
  const CompleteText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
            color: appColors.accent,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Text("COMPLETE",
            style: TextStyle(
                color: appColors.warning, fontWeight: FontWeight.bold)));
  }
}
