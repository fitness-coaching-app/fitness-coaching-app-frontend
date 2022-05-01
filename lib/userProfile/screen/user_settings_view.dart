import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_settings_editProfile_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_settings_password_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';

import '../../signIn_view.dart';

class UserProfileSettings extends StatefulWidget {
  const UserProfileSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileSettingsState();
}

class UserProfileSettingsState extends State<UserProfileSettings> {
  var userData = Hive.box('user').get('data');
  bool loading = false;

  Future<void> signOut() async {
    setState(() {
      loading = true;
    });
    await Hive.box('user').clear();
    await Hive.box('token').clear();
    setState(() {
      loading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (route) => SignIn()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(title: "Settings", backButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 21,
              ),
              //profile head section

                  //profile picture details
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          userData["profilePicture"]),
                                      fit: BoxFit.cover,
                                    )))),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userData["displayName"],
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                                Container(
                                  height: 5,
                                ),
                                Text(
                                "Level ${userData["level"]}     ${userData["xp"]} XP",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ]),
                        ],
                      )),

                  //options section
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSettingsProfile()));
                      },
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            Text("Edit Profile",
                                style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        Icon(Ionicons.chevron_forward,
                            size: 22, color: Color(0xb2517086))
                      ]))),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => UserSettingsPrivacy()));
              //     },
              //     child: Padding(
              //         padding: EdgeInsets.all(10),
              //         child: Row(children: [
              //           Text("Privacy",
              //               style: const TextStyle(
              //                   color: color_dark,
              //                   fontWeight: FontWeight.w600,
              //                   fontFamily: "Poppins",
              //                   fontStyle: FontStyle.normal,
              //                   fontSize: 16.0),
              //               textAlign: TextAlign.left),
              //           Expanded(child: Container()),
              //           Icon(Ionicons.chevron_forward,
              //               size: 22, color: Color(0xb2517086))
              //         ]))),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => UserSettingsNotifications()));
              //     },
              //     child: Padding(
              //         padding: EdgeInsets.all(10),
              //         child: Row(children: [
              //           Text("Notifications",
              //               style: const TextStyle(
              //                   color: color_dark,
              //                   fontWeight: FontWeight.w600,
              //                   fontFamily: "Poppins",
              //                   fontStyle: FontStyle.normal,
              //                   fontSize: 16.0),
              //               textAlign: TextAlign.left),
              //           Expanded(child: Container()),
              //           Icon(Ionicons.chevron_forward,
              //               size: 22, color: Color(0xb2517086))
              //         ]))),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => UserQrcode()));
              //     },
              //     child: Padding(
              //         padding: EdgeInsets.all(10),
              //         child: Row(children: [
              //           Text("My QR Code",
              //               style: const TextStyle(
              //                   color: color_dark,
              //                   fontWeight: FontWeight.w600,
              //                   fontFamily: "Poppins",
              //                   fontStyle: FontStyle.normal,
              //                   fontSize: 16.0),
              //               textAlign: TextAlign.left),
              //           Expanded(child: Container()),
              //           Icon(Ionicons.chevron_forward,
              //               size: 22, color: Color(0xb2517086))
              //         ]))),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserSettingsPassword()));
                  },
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text("Change Password",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Icon(Ionicons.chevron_forward,
                                size: 22, color: Color(0xb2517086))
                          ]))),
                  Container(height: 38),
                  GestureDetector(
                  onTap: () async {
                    await signOut();
                  },
                  child: Center(
                      child: Text("Sign Out",
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center))),

                  //bottom section
                  Container(
                    height: 30,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
