import "package:flutter/material.dart";
import 'package:yawwn/pages/authentication/password_field.dart';

import 'email_field.dart';
import 'form_button.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback startLogin;

  const RegisterForm({required this.startLogin, Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
            const SizedBox(height: 40),
            FormButton("Register", () => widget.startLogin()),
            const SizedBox(height: 40),
            const Text("Already have an account?"),
            TextButton(
                onPressed: widget.startLogin, child: const Text("Log in")),
          ])),
    );
  }
}
