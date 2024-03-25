import 'dart:io';

import 'package:flutter/material.dart';

class CompletedProfileController extends ChangeNotifier {
 late File _image;

  File get image => _image;

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }
}