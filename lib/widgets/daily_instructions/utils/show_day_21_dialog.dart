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
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image:
                    AssetImage("assets/decor/radial-gradient-background.png"),
                fit: BoxFit.cover,
              )),
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
                        const SizedBox(height: 20),
                      ]),
                ],
              ),
            ),
          )));
}

Widget boldText(String text) {
  return Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center);
}
