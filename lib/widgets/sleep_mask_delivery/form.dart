import "package:flutter/material.dart";

//No need to be stateful, we'll be mocking form submission
class SleepMaskForm extends StatelessWidget {
  const SleepMaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      TextField(
        decoration: InputDecoration(hintText: "Enter your full name"),
      ),
      TextField(
        decoration: InputDecoration(hintText: "Enter your address"),
      ),
      TextField(
        decoration: InputDecoration(hintText: "Enter your phone"),
      ),
      TextField(
        decoration: InputDecoration(hintText: "Printed name on sleep mask"),
      )
    ]);
  }

  Widget buildInput(String hintText) {
    return (TextField(decoration: InputDecoration(hintText: hintText)));
  }
}
