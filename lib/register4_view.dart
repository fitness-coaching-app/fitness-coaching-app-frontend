import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/newUserSetup0_view.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class Register4 extends StatefulWidget {
  const Register4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register4State();
}

class Register4State extends State<Register4> {
  File? _image;
  File? _imageTemp;
  String? imageBase64;

  String accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYWNjZXNzVG9rZW4iLCJkaXNwbGF5TmFtZSI6InBvcmFtZWUiLCJpYXQiOjE2NDcwOTA4MzIsImV4cCI6MTY0NzA5MTQzMn0.SOp4edUaiWYsYbnlYEhIS7Tj25o3VgQl1eK3uYYnrkA";

  ImagePicker imagePicker = ImagePicker();
  Future pickImage() async {
    try {
      final _image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (_image == null) return;

      setState(() => this._image = File(_image.path));
      _imageTemp = File(_image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    compressFile(_image!);
  }

  Future<String> compressFile(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    // final outPath = "${splitted}_out${filePath.substring(lastIndex)}.webp";
    final outPath = "${splitted}_out.webp";
    File? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 95,
      format: CompressFormat.webp,
    );
    final bytes = File(result!.path).readAsBytesSync();
    String base64Image = base64Encode(bytes) + ";type=image/webp;base64";
    print("img_pan : $base64Image");
    // imageBytes = result?.readAsBytesSync().toString();
    imageBase64 = base64Image;
    return base64Image;
  }

  Future<void> editProfilePicture(String imageBytes) async {
    var url = Uri.parse(Environment.editProfilePictureUrl);
    var response = await http.post(url,
        headers: {"Authorization": ("Bearer" + accessToken)},
        body: {"profilePicture": imageBytes});
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("edit profile picture failed");
      print(response.body);
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
                                        image: _image == null
                                            ? AssetImage(
                                                    'assets/Icon/camera.png')
                                                as ImageProvider
                                            : FileImage(_image!),
                                        fit: BoxFit.cover,
                                      ))))),
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
                                    if (imageBase64 != null) {
                                      editProfilePicture(imageBase64!);
                                    }
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
