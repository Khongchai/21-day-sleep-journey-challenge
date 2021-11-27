import "package:flutter/material.dart";
import 'package:yawwn/widgets/common/dialog_exit_button.dart';

Future<void> showCustomColumnDialog(BuildContext context, List<Widget> children,
    {Color? bgColor = const Color(0xff504098)}) {
  return showGeneralDialog(
      context: context,
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.elasticInOut.transform(a1.value);
        return Transform.scale(
          scale: curvedValue,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
                backgroundColor: bgColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const DialogExitButton(),
                        ...children,
                      ]),
                )),
          ),
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          Container());
}

Widget boldText(String text) {
  return Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center);
}
