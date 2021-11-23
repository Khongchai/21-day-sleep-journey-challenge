import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:yawwn/widgets/authentication/login_state_enum.dart';

class UserRelatedState extends ChangeNotifier {
  UserRelatedState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _currentUser = user;
        _loginState = ApplicationLoginState.loggedIn;

        userId = user.uid;

        _userDayProgressSubscription = FirebaseFirestore.instance
            .collection("userData")
            .doc(user.uid)
            .snapshots()
            .listen((snapshot) {
          if (snapshot.exists) {
            _userDayProgress = snapshot.get("day");
            notifyListeners();
          }
        });
      } else {
        _loginState = ApplicationLoginState.showingLoginPage;
        _userDayProgressSubscription?.cancel();
      }
      notifyListeners();
    });
  }

  //How far the user is from the last day
  String userId = "";
  int _userDayProgress = 0;
  int get userDayProgress => _userDayProgress;
  StreamSubscription<DocumentSnapshot>? _userDayProgressSubscription;

  set userDayProgress(int day) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception("Must be logged in!");
    }

    FirebaseFirestore.instance
        .collection("userData")
        .doc(userId)
        .set({"day": day});

    notifyListeners();
  }

  //Auth stuff

  User? _currentUser;
  User? get currentUser => _currentUser;

  ApplicationLoginState _loginState = ApplicationLoginState.showingLoginPage;
  ApplicationLoginState get loginState => _loginState;

  void startRegister() {
    _loginState = ApplicationLoginState.showingRegisterPage;
    notifyListeners();
  }

  void startLogin() {
    _loginState = ApplicationLoginState.showingLoginPage;
    notifyListeners();
  }

  void registerAccount(String email, String username, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(username);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, "/", (Route<dynamic> route) => false);
  }
}
