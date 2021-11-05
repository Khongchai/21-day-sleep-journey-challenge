import "package:flutter/material.dart";
import 'package:yawwn/pages/authentication/password_field.dart';

import 'email_field.dart';
import 'form_button.dart';

class LogInForm extends StatefulWidget {
  final VoidCallback startRegister;

  const LogInForm({required this.startRegister, Key? key}) : super(key: key);

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
            EmailField(_emailController),
            const SizedBox(height: 20),
            PasswordField(_passwordController),
            const SizedBox(height: 50),
            FormButton("LOG IN", () => print("Login button clicked")),
            const SizedBox(height: 50),
            const Text("Don't have an account yet?"),
            TextButton(
                onPressed: widget.startRegister,
                child: const Text("Create an account")),
          ])),
    );
  }
}
