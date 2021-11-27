import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yawwn/i18n/strings.g.dart';
import 'package:yawwn/pages/instructions.dart';
import 'package:yawwn/widgets/background_decorations/moon_and_stars_background.dart';
import 'package:yawwn/widgets/common/bottom_navigation_buttons.dart';
import 'package:yawwn/widgets/common/stack_container.dart';
import 'package:yawwn/widgets/homepage/welcome_text.dart';

class LandingPage extends StatefulWidget {
  static const screenName = "/";
  final User currentUser;

  const LandingPage({required this.currentUser, Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledStackContainer(children: [
        const MoonAndStarsBackground(),
        Stack(children: [
          FutureBuilder(
              future: _prefs,
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? WelcomeText(
                        username: widget.currentUser.displayName!,
                        prefs: snapshot.data as SharedPreferences,
                      )
                    : const SizedBox();
              }),
          BottomNavigationButtons(
            goForwardText: t.begin_button,
            forwardOnPressed: () =>
                Navigator.pushNamed(context, Instructions.screenName),
          ),
        ]),
      ]),
    );
  }
}
