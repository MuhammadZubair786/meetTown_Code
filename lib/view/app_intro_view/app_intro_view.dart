// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Auth/auth_view.dart';


class AppIntroView extends StatelessWidget {
  AppIntroView({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Dating App",
      body:
         "Register for free\nThe place where travellers match"+" CONNECT WITH PEOPLE WITH THE SAME AFFINITY FOR TRAVEL".toLowerCase(),
      image: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage("https://www.meetown.com/public/imgs/home/img-350x400_1.webp"),
      )
    ),
    PageViewModel(
     title: "Dating App",
      body:
          "Find near by traveller\n"+"Browse profiles and chat with the travellers you want to meet",
      image: CircleAvatar(
        backgroundImage: AssetImage('assets/imgs/china-1.jpg'),
        radius: 100,
     ),
    ),
    PageViewModel(
       title: "Dating App",
      body:
          "Add your trip\n"+"Enter your trip and see all the travellers who will be there at the same time as you",
      image:
       CircleAvatar(
        backgroundImage: AssetImage('assets/imgs/travel-networking.jpg'),
        radius: 100,
     ),
     
    ),
     PageViewModel(
       title: "Dating App",
      body:
          "Share your best travel picture, advise travellers about the best to do in the city",
      image:
       CircleAvatar(
        backgroundImage: NetworkImage('https://www.meetown.com/public/imgs/home/img-350x400_4.webp'),
        radius: 100,
     ),
     
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
            child: IntroductionScreen(
              // globalBackgroundColor: Colors.transparent,
              pages: pages,
              onDone: () {
                // Navigate to main screen after intro completion
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => AuthView(),
                  ),
                );
              },
              showSkipButton: true,
              skip: Text("Skip",style: TextStyle(
                color: appColors.textBlueColor
              ),),
              done: Text("Done",style: TextStyle(
                color: appColors.textBlueColor),),
              next: Icon(Icons.arrow_forward),
              dotsDecorator: DotsDecorator(
                size: Size(10.0, 10.0),
                color: Colors.grey,
                activeSize: Size(22.0, 10.0),
                activeColor: appColors.textBlueColor,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
        ));
  }
}
