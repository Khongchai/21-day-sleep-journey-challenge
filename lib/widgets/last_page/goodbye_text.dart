import "package:flutter/material.dart";
import 'package:yawwn/i18n/strings.g.dart';

class GoodbyeText extends StatelessWidget {
  const GoodbyeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1 / 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t.welcome_text.title,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          const Text("Sleep Journey Challenge",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 40),
          const Text(
            "Time to say goodbye, we wish ",
            textAlign: TextAlign.center,
          ),
          const Text("you a happy sleeping routine"),
          const Text(
            "and many happy and peaceful nights!",
          ),
          const SizedBox(height: 20),
          const Text("Better sleep better life")
        ],
      ),
    );
  }
}
