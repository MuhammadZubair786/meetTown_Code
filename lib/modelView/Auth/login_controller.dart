import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _checkBox = false;


  bool get checkBox => _checkBox;

  void setCheckboxValue(v) {
    _checkBox = v;
    notifyListeners();
  }

  void login(){

  }
}
