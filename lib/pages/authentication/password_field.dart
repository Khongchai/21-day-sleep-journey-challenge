import "package:flutter/material.dart";

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "Password", hintStyle: TextStyle(color: Colors.grey)),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter your password to continue";
          }
          return null;
        });
  }
}
