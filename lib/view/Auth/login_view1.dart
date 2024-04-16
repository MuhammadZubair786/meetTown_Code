import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/view/Auth/LoginView.dart';
import 'package:meettown/view/Auth/sign_up_view.dart';
import '../../res/appcolors.dart';


class LoginView1 extends StatelessWidget {
  const LoginView1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 200,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/appbarLogo.png',
                      height: 80,
                    ),
                    Text(
                      'Sign in to Meetown',
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
                    ),
                    Container(
                      width: size.width * .70,
                      child: Text(
                        'Manage your account, your trips, your contacts and so much more ...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 210,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginView()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: size.width * .70,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 17, 130, 223),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.email),
                            Text(
                              'Continue with Email Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color: appColors.appBarBgWhite,
                                      fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: size.width * .70,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 17, 130, 223),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(FontAwesomeIcons.google),
                            Text('Continue with Google',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: appColors.appBarBgWhite,
                                        fontSize: 14))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: size.width * .70,
                        height: 50,
                        decoration: BoxDecoration(
                            color: appColors.textBlueColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(FontAwesomeIcons.facebookF),
                            Text('Continue with FaceBook',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: appColors.appBarBgWhite,
                                        fontSize: 14))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Don't have an account yet ?",
                    style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpView()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: size.width * .40,
                        height: 50,
                        decoration: BoxDecoration(
                            color: appColors.textBlueColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email),
                            SizedBox(width: 20,),
                            Text(
                              'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color: appColors.appBarBgWhite,
                                      fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * .70,
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: 'By continuing you confirm that you agree to our',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: appColors.textPrimaryColor)),
                      TextSpan(
                          text: 'Terms  ',
                          style: Theme.of(context).textTheme.headline2!),
                      TextSpan(
                          text: ' and have read our ',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: appColors.textPrimaryColor)),
                      TextSpan(
                          text: ' Privacy Policy ',
                          style: Theme.of(context).textTheme.headline2),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
