import 'dart:io';
import 'dart:typed_data';

import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/touchable_text.dart';
import 'package:fitness_coaching_application_test/userSetup/screen/newUserSetup0_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ionicons/ionicons.dart';
import 'package:http_parser/http_parser.dart';

import '../../api_util.dart';

class Register4 extends StatefulWidget {
  const Register4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register4State();
}

class Register4State extends State<Register4> {
  File? _image;
  String? imageBase64;
  String? imagePath;

  ImagePicker imagePicker = ImagePicker();

  ButtonStatus status = ButtonStatus.active;

  Future pickImage() async {
    try {
      final _image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (_image == null) return;

      setState(() => this._image = File(_image.path));
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> compressFile(File file) async {
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
    print("Image Selected");
    imagePath = result!.path;
  }

  Future<Map<String, dynamic>?> editProfilePicture() async {
    setState(() {
      status = ButtonStatus.loading;
    });
    print("compress...");
    await compressFile(_image!);
    var response = await API.formData(Environment.editProfilePictureUrl,
        {"profilePicture": imagePath}, MediaType('image', 'webp'),
        withToken: true);
    setState(() {
      status = ButtonStatus.active;
    });
    if (response != null) {
      if (response.statusCode == 200) {
        print(response.body);
        return {"error": false};
      } else {
        print("edit profile picture failed");
        print(response.body);
        return {"error": true, "body": jsonDecode(response.body)};
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 21, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FCABackButton(),
                Container(
                  height: 45,
                ),
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: _image == null
                                      ? AssetImage('assets/Icon/camera.png')
                                          as ImageProvider
                                      : FileImage(_image!),
                                  fit: BoxFit.cover,
                                ))))),
                Container(
                  height: 40,
                ),
                MainButtonHighlight(
                    text: "Next",
                    status: status,
                    onPressed: () {
                      editProfilePicture().then((value) {
                        if (value != null && !value["error"]) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewUserSetup0()));
                        }
                      });
                    }),
                // Button
                Container(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TouchableText(
                      text: "Skip for Now",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewUserSetup0()),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
