import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modelView/Services/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 double opacityLevel = 0.0;

  double _scale = 0.0;

   @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  void changeOpacity() {
    setState(() {
      _scale = _scale + 0.05;
      opacityLevel += 0.2;
    });
    print(_scale);
    if (_scale < 1.7) {
      Future.delayed(Duration(milliseconds: 40), () {
        changeOpacity();
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashController>(context, listen: false)
        .splashService(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 94, 98),
      body: Center(
        child: Transform.scale(
          scale: _scale,
          child: Image.network('https://www.meetown.com/public/media-storage/logo/logo-light.png?ver=')),
      ),
    );
  }
}
