import "package:flutter/material.dart";
import 'package:yawwn/widgets/common/dialog_exit_button.dart';

Future<void> showDay21Dialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          backgroundColor: const Color(0xff504098),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DialogExitButton(),
                      Image.asset("assets/decor/cheers.png"),
                      boldText("It's the last day"),
                      boldText("Awesome!!"),
                      boldText("Hope you got some great sleep!"),
                      // SvgPicture.asset("assets/decor/seventh-day-decor.svg"),
                    ]),
                Positioned(
                  child: Image.asset(
                      "assets/decor/radial-gradient-background.png"),
                )
              ],
            ),
          )));
}

Widget boldText(String text) {
  return Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center);
}
