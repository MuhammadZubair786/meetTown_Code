import 'package:flutter/material.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';


class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Complete Profile',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: appColors.textPrimaryColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // imageProvider.image != null
            //     ? Image.file(
            //         imageProvider.image,
            //         height: 200,
            //       )
            //     : Placeholder(
            //         fallbackHeight: 200,
            //         fallbackWidth: 200,
            //       ),

            CustomButtonWidget(
                title: 'Get Image',
                foregroundColor: appColors.iconPrimaryColor,
                bgColor: appColors.textBlueColor,
                selectedFgButtonColor: appColors.iconPrimaryColor,
                onpress: () {}),
            SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
                title: 'completed Profile',
                foregroundColor: appColors.iconPrimaryColor,
                bgColor: appColors.textBlueColor,
                selectedFgButtonColor: appColors.iconPrimaryColor,
                onpress: () {})
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // _pickImage(ImageSource.camera);
            //   },
            //   child: Text('Pick Image from Camera'),
            // ),
            // ElevatedButton(
            //   onPressed: () => () {
            //     //  _pickImage(ImageSource.gallery)
            //   },
            //   child: Text('Pick Image from Gallery'),
            // ),
          ],
        ),
      ),
    );
  }
}
