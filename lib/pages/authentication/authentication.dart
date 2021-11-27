import "package:flutter/material.dart";
import 'package:yawwn/widgets/authentication/login_form.dart';
import 'package:yawwn/widgets/authentication/register_form.dart';
import 'package:yawwn/widgets/common/stack_container.dart';

import '../../widgets/authentication/login_state_enum.dart';

class Authentication extends StatelessWidget {
  static const screenName = "/";

  final ApplicationLoginState loginState;
  final VoidCallback startRegister;
  final VoidCallback startLogin;
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

  const Authentication({
    required this.loginState,
    required this.startRegister,
    required this.startLogin,
    required this.signInWithEmailAndPassword,
    required this.registerAccount,
  });

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.showingLoginPage:
        return Scaffold(
          body: StyledStackContainer(
            children: [
              LogInForm(
                  startRegister: startRegister,
                  signInWithEmailAndPassword: signInWithEmailAndPassword)
            ],
          ),
        );
      case ApplicationLoginState.showingRegisterPage:
        return Scaffold(
          body: StyledStackContainer(
            children: [
              RegisterForm(
                startLogin: startLogin,
                registerAccount: registerAccount,
              )
            ],
          ),
        );
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }
}
