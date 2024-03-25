import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  String title;
  Color foregroundColor, bgColor, selectedFgButtonColor;
  final VoidCallback onpress;
  double? width = 80, heigth = 40;

  CustomButtonWidget(
      {super.key,
      required this.title,
      required this.foregroundColor,
      required this.bgColor,
      required this.selectedFgButtonColor,
      required this.onpress,
      this.heigth,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return foregroundColor; // Black color otherwise
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                bgColor), // Set your desired background color
          ),
          onPressed: () {
            onpress();
          },
          child: Text(title)),
    );
  }
}
