import "package:flutter/material.dart";
import 'package:yawwn/widgets/common/dialog_exit_button.dart';

Future<void> showDay7Dialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          backgroundColor: const Color(0xff504098),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DialogExitButton(),
                  boldText("It's the 7th day!"),
                  boldText("Don't give up yet."),
                  boldText("We have a surprise waiting for you at the end"),
                  Image.asset("assets/decor/day-7-decor.png"),
                  // SvgPicture.asset("assets/decor/seventh-day-decor.svg"),
                ]),
          )));
}

Widget boldText(String text) {
  return Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center);
}
