import "package:flutter/material.dart";

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 30,
        child: SizedBox(
          width: 1 / 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("21 DAYS", style: TextStyle(fontSize: 30)),
              Text("SLEEP CHALLENGE", style: TextStyle(fontSize: 30))
            ],
          ),
        ));
  }
}
