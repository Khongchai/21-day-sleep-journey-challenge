import 'package:flutter/cupertino.dart';
import 'package:yawwn/pages/authentication/login_state_enum.dart';

class AuthenticationState extends ChangeNotifier {
  AuthenticationState() {
/*
    init();
*/
  }

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
}
