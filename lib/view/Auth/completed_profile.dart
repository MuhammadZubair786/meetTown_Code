import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meettown/view/Auth/Selectlocation.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({Key? key}) : super(key: key);

  @override
  _CompleteProfileViewState createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: appColors.textBlueColor,
        centerTitle: true,
        title: Text(
          'Complete Profile',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: appColors.textPrimaryColor),
        ),
      ),
      body: Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10,),
              Text("Select Profile Picture",
              style: TextStyle(fontSize: 25,fontFamily: "arial",color: Colors.white),
              ),
              SizedBox(height: 10,),
              Container(
                width: 200, // Provide a fixed width to the container
                child: Stack(
                  children: [
                    Container(
                      width: 200, // Same width as the container
                      height: 200,
                      child: _image == null
                          ? Image(
                              image: NetworkImage(
                               "https://static.vecteezy.com/system/resources/previews/019/879/198/original/user-icon-on-transparent-background-free-png.png",
                              ),
                              width: 200,
                              height: 200,
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(_image!),
                            ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.5,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: -10,
                      child: RawMaterialButton(
                        onPressed: () {
                          _showSourceDialog();
                        },
                        elevation: 10.0,
                        fillColor: Color.fromARGB(255, 25, 106, 172),
                        child: Icon(Icons.camera_alt_outlined, color: const Color.fromARGB(255, 242, 243, 244)),
                        padding: EdgeInsets.all(2),
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButtonWidget(
                          title: 'Previous',
                          foregroundColor: appColors.iconPrimaryColor,
                          bgColor: Colors.grey,
                          selectedFgButtonColor: appColors.iconPrimaryColor,
                          onpress: () {}),
                      CustomButtonWidget(
                          title: 'Next',
                          foregroundColor: appColors.iconPrimaryColor,
                          bgColor: appColors.textBlueColor,
                          selectedFgButtonColor: appColors.iconPrimaryColor,
                          onpress: () {
                             Navigator.push(context,
          MaterialPageRoute(builder: (context) => SetLoctationScreen()));
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSourceDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(width: 10),
                      Text('Take Picture'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(width: 10),
                      Text('Choose from Gallery'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
