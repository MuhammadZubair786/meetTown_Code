import 'package:flutter/material.dart';
import 'package:meettown/view/Auth/login_view1.dart';
import 'package:meettown/view/Auth/sign_up_view.dart';

import '../../res/components/custom_button.dart';
import '../../res/appcolors.dart';

// import 'package:meetown/view/Auth/LoginView.dart';
// import 'package:meetown/view/Auth/sign_up_view.dart';

// ignore: must_be_immutable
class AuthView extends StatelessWidget {
  AuthView({super.key});
  final ValueNotifier<bool> isLogin = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 120,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/appbarLogo.png',
                      height: 80,
                      color: Colors.white,
                    ),
                    Container(
                      width: size.width * .60,
                      child: Text(
                        'Enter your personal detials and start journey with us',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonWidget(
                      title: 'SIGN IN',
                      foregroundColor: appColors.buttonTextSelectedPrimaryColor,
                      bgColor: appColors.appBgColor,
                      selectedFgButtonColor: appColors.buttonTextPrimaryColor,
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView1()));

                        // // print('login');
                        // isLogin.value = true;
                        // // Provider.of<AuthController>(context,listen: false).setAuthLoginStatus();
                      }),
                  CustomButtonWidget(
                      title: 'SIGN UP',
                      foregroundColor: appColors.buttonTextSelectedPrimaryColor,
                      bgColor: appColors.appBgColor,
                      selectedFgButtonColor: appColors.buttonTextPrimaryColor,
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpView()));
                        // print('login');

                        // isLogin.value = false;
                        // value.setAuthSignStatus();
                      }),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),

              // ValueListenableBuilder<bool>(
              //   // Listen to changes in ValueNotifier<bool>
              //   valueListenable: isLogin,
              //   builder: (context, value, child) {
              //     // Display different text based on the value of isLogin
              //     return value ? LoginView() : SignUpView();
              //   },
              // ),
              // // islogin ?  :
            ],
          ),
        ),
      ),
    );
  }
}
