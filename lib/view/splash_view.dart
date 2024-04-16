import 'package:flutter/material.dart';
import 'package:meettown/view/Auth/auth_view.dart';
import 'package:meettown/view/app_intro_view/app_intro_view.dart';
import 'package:provider/provider.dart';

import '../modelView/Services/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 double opacityLevel = 0.0;
//  var controller = Get.put(SplashController());

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
       Navigator.push(
            context, MaterialPageRoute(builder: (context) => AppIntroView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<SplashController>(context, listen: false)
    //     .splashService(context);
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 240, 240),
      body: Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Transform.scale(
            scale: _scale,
            child: Image.network('https://www.meetown.com/public/media-storage/logo/logo-light.png?ver=')),
        ),
      ),
    );
  }
}
