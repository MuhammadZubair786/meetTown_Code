
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool authIsLoginStatus = false;
  bool authIsSignStatus = false;

  setAuthLoginStatus() {
    authIsLoginStatus = true;
    authIsSignStatus = false;
    notifyListeners();
  }

  setAuthSignStatus() {
    authIsLoginStatus = false;
    authIsSignStatus = true;
    notifyListeners();
  }
}
