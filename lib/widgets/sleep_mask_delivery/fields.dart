import "package:flutter/material.dart";

//No need to be stateful, we'll be mocking form submission
class SleepMaskFields extends StatelessWidget {
  const SleepMaskFields({Key? key}) : super(key: key);

  static const _space = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildInput("Enter your full name"),
      _space,
      buildInput("Enter your address"),
      _space,
      buildInput("Enter your phone"),
      _space,
      buildInput("Printed name on sleep mask"),
    ]);
  }

  Widget buildInput(String hintText) {
    return (TextField(
        style: const TextStyle(color: Colors.black, fontSize: 15),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15))));
  }
}
