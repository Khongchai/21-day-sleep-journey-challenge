import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:yawwn/widgets/authentication/login_state_enum.dart';

class AuthenticationState extends ChangeNotifier {
  AuthenticationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _currentUser = user;
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.showingLoginPage;
      }
      notifyListeners();
    });
  }

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
