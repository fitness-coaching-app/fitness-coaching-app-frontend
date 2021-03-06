import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UserQrcode extends StatefulWidget {
  const UserQrcode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserQrcodeState();
}

class UserQrcodeState extends State<UserQrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Ionicons.arrow_back,
                      size: 30,
                      color: color_dark,
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("QR Code",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left)),
              ],
            ),

            //profile picture details
            Container(
              height: 20,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Center(
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(360),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Icon/camera.png'),
                                        fit: BoxFit.cover,
                                      ))))),
                    ),
                    Expanded(child: Container()),
                    // MarioSnyder
                    Text("MarioSnyder",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.center),
                    Expanded(child: Container())
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: const Color(0xffc0ffd9)),
            ),

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
