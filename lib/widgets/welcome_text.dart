import "package:flutter/material.dart";

class WelcomeText extends StatelessWidget {
  final String username;

  const WelcomeText({required this.username, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1 / 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("21 DAYS",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          Text("Hello, $username", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          const Text("Your journey to a healthier"),
          const SizedBox(height: 10),
          const Text("life and better sleep routine."),
        ],
      ),
    );
  }
}
