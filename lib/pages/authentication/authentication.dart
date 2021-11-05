import "package:flutter/material.dart";
import 'package:yawwn/pages/authentication/login_form.dart';
import 'package:yawwn/pages/authentication/register_form.dart';
import 'package:yawwn/widgets/stack_container.dart';

import 'login_state_enum.dart';

class Authentication extends StatelessWidget {
  static const route = "/";

  final ApplicationLoginState loginState;
  final VoidCallback startRegister;
  final VoidCallback startLogin;
/*  final String? email;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;
  final void Function() signOut;*/

  Authentication({
    required this.loginState,
    required this.startRegister,
    required this.startLogin,
  });

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.showingLoginPage:
        return Scaffold(
          body: StackContainer(
            children: [
              LogInForm(
                startRegister: startRegister,
              )
            ],
          ),
        );
      case ApplicationLoginState.showingRegisterPage:
        return Scaffold(
          body: StackContainer(
            children: [RegisterForm(startLogin: startLogin)],
          ),
        );

      /* case ApplicationLoginState.emailAddress:
        return EmailForm(
            callback: (email) => verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));
      case ApplicationLoginState.password:
        return PasswordForm(
          email: email!,
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
          ) {
            registerAccount(
                email,
                displayName,
                password,
                (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: StyledButton(
                onPressed: () {
                  signOut();
                },
                child: const Text('LOGOUT'),
              ),
            ),
          ],
        );*/
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }
}
