import 'dart:io';

import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../api_util.dart';

class UserSettingsProfile extends StatefulWidget {
  const UserSettingsProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserSettingsProfileState();
}

class UserSettingsProfileState extends State<UserSettingsProfile> {
  var userData = Hive.box('user').get('data');
  ImagePicker imagePicker = ImagePicker();
  File? _image;
  String? imageBase64;
  String? imagePath;
  bool loading = false;

  Future pickImage() async {
    try {
      print("Picking image...");
      final _image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (_image == null) return;
      print("Image Picked");

      setState(() {
        this._image = File(_image.path);
      });
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

  Future<void> editProfilePicture() async {
    print("compress...");
    await compressFile(_image!);
    var response = await API.formData(Environment.editProfilePictureUrl,
        {"profilePicture": imagePath}, MediaType('image', 'webp'),
        withToken: true);

    API.responseAlertWhenError(
        context: context, response: response, whenSuccess: (r) {});

    var userDataResponse =
        await API.get(Environment.getUserInfoUrl, withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: userDataResponse,
        whenSuccess: (r) async {
          print("Update success!");
          await Hive.box('user').put('data', r.results!);
          setState(() {
            userData = r.results!;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
          title: "Edit Profile",
          backButton: true,
          actionButton: (() {
            if (loading) {
              return SpinKitThreeBounce(size: 20, color: color_dark);
            } else {
              return Container();
            }
          }()),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //profile picture details
                Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          userData['profilePicture'] == null ||
                                                  userData['profilePicture'] ==
                                                      ""
                                              ? Environment.noImageUrl
                                              : userData['profilePicture']),
                                      fit: BoxFit.cover,
                                    )))),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            await pickImage();
                            await editProfilePicture();
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Text("Change Profile Picture",
                              style: const TextStyle(
                                  color: const Color(0xff00a682),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left),
                        ),
                        Expanded(child: Container())
                      ],
                        )),
                    Container(
                        height: 54,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Display Name",
                                  style: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              Text(userData["displayName"],
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)
                        ])),
                    Container(
                        height: 54,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              Text(userData["email"],
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)
                        ])),
                    Container(
                        height: 54,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender",
                                  style: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              Text(userData["gender"],
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)
                        ])),
                    Container(
                        height: 54,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Birthyear",
                                  style: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              Text(userData["birthYear"].toString(),
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)
                        ])),
                    //bottom section
                    Container(
                      height: 30,
                    ),
                  ],
                ),
              )),
        ));
  }
}
