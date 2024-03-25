import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modelView/Auth/password_visibility_controller.dart';

class CustomTextInputField extends StatelessWidget {
  String title;
  TextEditingController controller;
  TextInputType? keyboard=TextInputType.name;

  CustomTextInputField({
    super.key,
    required this.title,
    required this.controller,
  this.keyboard
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        keyboardType: keyboard,

      decoration: InputDecoration(
      
        hintText: title,
      ),
    );
  }
}

class CustomTextInputPasswordField extends StatelessWidget {
  String title;
  TextEditingController controller;

  CustomTextInputPasswordField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityModel>(
      builder: (context, passwordVisibilityModel, child) => TextFormField(
        obscureText: passwordVisibilityModel.isPasswordVisible,
        decoration: InputDecoration(
          
          hintText: title,
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisibilityModel.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              print(passwordVisibilityModel.isPasswordVisible);
              passwordVisibilityModel.togglePasswordVisibility();
            },
          ),
        ),
      ),
    );
  }
}



class CustomTextInputPasswordFieldForSignUp extends StatelessWidget {
  String title;
  TextEditingController controller;

  CustomTextInputPasswordFieldForSignUp({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityModel>(
      builder: (context, passwordVisibilityModel, child) => TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          
          hintText: title,
          
        ),
      ),
    );
  }
}
