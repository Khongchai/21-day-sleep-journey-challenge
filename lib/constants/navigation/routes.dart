import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yawwn/global_state/user_related_state.dart';
import 'package:yawwn/pages/authentication/authentication.dart';
import 'package:yawwn/pages/daily_instructions.dart';
import 'package:yawwn/pages/homepage.dart';
import 'package:yawwn/pages/instructions.dart';
import 'package:yawwn/pages/progress.dart';
import 'package:yawwn/widgets/authentication/login_state_enum.dart';

final Map<String, WidgetBuilder> routes = {
  Instructions.route: (context) => const Instructions(),
  Progress.route: (context) => const Progress(),
  DailyInstructions.route: (context) => const DailyInstructions(),
  Authentication.route: (context) => Consumer<UserRelatedState>(
      builder: (context, authState, _) => authState.loginState !=
              ApplicationLoginState.loggedIn
          ? Authentication(
              loginState: authState.loginState,
              startLogin: authState.startLogin,
              startRegister: authState.startRegister,
              registerAccount: authState.registerAccount,
              signInWithEmailAndPassword: authState.signInWithEmailAndPassword,
            )
          : MyHomePage(
              currentUser: authState.currentUser!,
            ))
};
