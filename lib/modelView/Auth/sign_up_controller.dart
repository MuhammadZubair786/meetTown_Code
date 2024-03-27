

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meettown/view/Auth/Stepper.dart';
import 'package:meettown/view/Auth/completed_profile.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController MobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimPassword = TextEditingController();
  bool _checkBox = false;
  late String selectedGenderValue;
  DateTime? selectDate;
  bool dateIsEmpty = true;

  void SelectedGenderValue(String newValue) {
    selectedGenderValue = newValue;
    notifyListeners();
  }

  void SelectedDateValue(newValue) {
    selectDate = newValue;
    dateIsEmpty = false;
    notifyListeners();
  }

  void SignUp(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StepperDemo()));
  }
}
