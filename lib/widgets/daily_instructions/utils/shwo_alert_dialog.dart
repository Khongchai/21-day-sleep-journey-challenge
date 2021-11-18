import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';

Future<void> showAlertDialog(
  BuildContext context,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
              backgroundColor: appColors.background,
              content: const Text(
                  """Before you sleep, follow the 2nd step previously mentioned. Then, see you tomorrow night !""",
                  style: TextStyle(color: Color(0xffffffff))),
              actions: [
                ElevatedButton(
                  child: const Text("Got it!",
                      style: TextStyle(color: Color(0xff000000))),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(appColors.accent)),
                  onPressed: () {},
                )
              ]));
}
