import "package:flutter/material.dart";

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String errorTextWhenEmpty;
  final String hintText;
  final bool? obscureText;

  const Field(
      {required this.controller,
      required this.errorTextWhenEmpty,
      required this.hintText,
      this.obscureText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText, hintStyle: const TextStyle(color: Colors.grey)),
        validator: (value) {
          if (value!.isEmpty) {
            return errorTextWhenEmpty;
          }
          return null;
        });
  }
}
