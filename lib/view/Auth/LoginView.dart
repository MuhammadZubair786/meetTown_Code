import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../modelView/Auth/login_controller.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';
import '../../res/components/custom_text_from_field.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<LoginController>(
        builder: (context, value, child) => Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
          width: size.width * .98,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Login to your account',
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextInputField(
                    title: 'Enter Email Address', controller: value.email),
                const SizedBox(
                  height: 10,
                ),
                CustomTextInputPasswordField(
                    title: 'Password', controller: value.password),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              value: value.checkBox,
                              onChanged: (v) {
                                value.setCheckboxValue(v);
                              }),
                          Text('Remember me',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    Text(
                      'Forget Password?',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 12, color: appColors.textBlueColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                    width: size.width * .95,
                    heigth: 50,
                    title: 'SIGN IN',
                    foregroundColor: appColors.buttonTextSelectedPrimaryColor,
                    bgColor: appColors.textBlueColor,
                    selectedFgButtonColor: appColors.buttonTextPrimaryColor,
                    onpress: () {
                      value.login();
                    }),
                SizedBox(
                  height: 10,
                ),
                Text('Or Login With',style: TextStyle(color: Colors.white),),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: appColors.textBlueColor,
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: appColors.iconPrimaryColor,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: appColors.primaryRedColor,
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: appColors.iconPrimaryColor,
                        size: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
