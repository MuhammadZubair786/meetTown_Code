import 'package:flutter/material.dart';
import 'package:meettown/view/Auth/auth_view.dart';

import '../../view/app_intro_view/app_intro_view.dart';

class SplashController extends ChangeNotifier {
  late bool intro = false;

  splashService(BuildContext context) {
    Future.delayed(Duration(seconds: 6), () {
      if (intro) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AuthView()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AppIntroView()));
      }
    });
  }
}
