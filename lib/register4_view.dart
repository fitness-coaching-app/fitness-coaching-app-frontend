import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/newUserSetup0_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class Register4 extends StatefulWidget {
  const Register4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register4State();
}

class Register4State extends State<Register4> {
  File? image;
  ImagePicker imagePicker = ImagePicker();
  Future pickImage() async {
    try {
      final image = await imagePicker.getImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Ionicons.arrow_back,
                      size: 30,
                      color: color_dark,
                    )),
                Container(
                  height: 45,
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add your Profile Picture",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 5,
                      ),
                      Text("Pick a profile picture for your account",
                          style: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 40,
                      ),
                      Center(
                          child: GestureDetector(
                              onTap: () {
                                pickImage();
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(360),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: image == null
                                              ? AssetImage(
                                                  'assets/Icon/camera.png')
                                              : FileImage(image!)))))),
                      Container(
                        height: 40,
                      ),
                      // Button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: new GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewUserSetup0()),
                                    );
                                  },
                                  child: Container(
                                      height: 60,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.5),
                                        child: new Text("Next",
                                            style: const TextStyle(
                                                color: color_dark,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.0),
                                            textAlign: TextAlign.center),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: color_teal))),
                            )
                          ]),
                      Container(
                        height: 20,
                      ),
                      Center(
                          child: new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewUserSetup0()),
                                );
                              },
                              child: Text("Skip for Now",
                                  style: const TextStyle(
                                      color: color_dimmedTeal,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center)))
                    ],
                  ),
                )),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
