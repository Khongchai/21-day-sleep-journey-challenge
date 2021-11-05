import "package:flutter/material.dart";
import 'package:yawwn/utils/show_single_button_dialog.dart';

import 'field.dart';
import 'form_button.dart';

class LogInForm extends StatefulWidget {
  final VoidCallback startRegister;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;

  const LogInForm(
      {required this.signInWithEmailAndPassword,
      required this.startRegister,
      Key? key})
      : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1 / 0,
      child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Field(
              controller: _emailController,
              errorTextWhenEmpty: "Email required",
              hintText: "Email",
            ),
            const SizedBox(height: 20),
            Field(
              controller: _passwordController,
              errorTextWhenEmpty: "Password required",
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 40),
            FormButton(
                "LOG IN",
                () => widget.signInWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                    (e) =>
                        showSingleButtonDialog(context, "sign in failed", e))),
            const SizedBox(height: 50),
            const Text("Don't have an account yet?"),
            TextButton(
                onPressed: widget.startRegister,
                child: const Text("Create an account")),
          ])),
    );
  }
}
