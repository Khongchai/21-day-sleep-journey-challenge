import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:yawwn/global_state/user_related_state.dart';
import 'package:yawwn/pages/authentication/authentication.dart';
import 'package:yawwn/pages/daily_instructions.dart';
import 'package:yawwn/pages/ending_pages/loading_page.dart';
import 'package:yawwn/pages/ending_pages/sleep_mask_delivery.dart';
import 'package:yawwn/pages/ending_pages/surprise.dart';
import 'package:yawwn/pages/instructions.dart';
import 'package:yawwn/pages/landing_page.dart';
import 'package:yawwn/pages/last_page.dart';
import 'package:yawwn/pages/progress.dart';
import 'package:yawwn/widgets/authentication/login_state_enum.dart';

final Map<String, WidgetBuilder> routes = {
  Instructions.screenName: (_) => const Instructions(),
  Progress.screenName: (_) => const Progress(),
  DailyInstructions.screenName: (_) => const DailyInstructions(),
  LastPage.screenName: (_) => const LastPage(),
  Surprise.screenName: (_) => const Surprise(),
  SleepMaskDeliveryPage.screenName: (_) => const SleepMaskDeliveryPage(),
  LoadingPageOverlay.screenName: (_) => const LoadingPageOverlay(),
  Authentication.screenName: (_) => Consumer<UserRelatedState>(
      builder: (_, authState, __) => authState.loginState !=
              ApplicationLoginState.loggedIn
          ? Authentication(
              loginState: authState.loginState,
              startLogin: authState.startLogin,
              startRegister: authState.startRegister,
              registerAccount: authState.registerAccount,
              signInWithEmailAndPassword: authState.signInWithEmailAndPassword,
            )
          : LandingPage(
              currentUser: authState.currentUser!,
            ))
};
