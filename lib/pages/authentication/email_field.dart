import "package:flutter/material.dart";

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            hintText: "Enter your email",
            hintStyle: TextStyle(color: Colors.grey)),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter your email address to continue";
          }
          return null;
        });
  }
}
