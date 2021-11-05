import "package:flutter/material.dart";

import './form_button.dart';
import 'field.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback startLogin;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;

  const RegisterForm(
      {required this.startLogin, required this.registerAccount, Key? key})
      : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

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
              controller: _usernameController,
              errorTextWhenEmpty: "Username required",
              hintText: "Username",
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
                "Register",
                () => widget.registerAccount(
                    _emailController.text,
                    _usernameController.text,
                    _passwordController.text,
                    (e) =>
                        _showErrorDialog(context, "Registration failed", e))),
            const SizedBox(height: 40),
            const Text("Already have an account?"),
            TextButton(
                onPressed: widget.startLogin, child: const Text("Log in")),
          ])),
    );
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
