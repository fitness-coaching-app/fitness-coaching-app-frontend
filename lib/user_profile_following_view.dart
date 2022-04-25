import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/user_profile_follower_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class UserProfileFollowing extends StatefulWidget {
  const UserProfileFollowing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileFollowingState();
}

class UserProfileFollowingState extends State<UserProfileFollowing> {
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
                Container(
                  width: 20,
                ),
                Text("MarioSnyder",
                    style: const TextStyle(
                        color: color_dark,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 26.0),
                    textAlign: TextAlign.left),
              ],
            ),

            //follower toggle
            Container(
              height: 20,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFefefef),
                  borderRadius: BorderRadius.circular(40)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 2) - 25,
                    decoration: BoxDecoration(
                        color: Color(0xFFefefef),
                        borderRadius: BorderRadius.circular(40)),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileFollower()),
                          );
                        },
                        child: Center(
                          child: Text("Follower",
                              style: const TextStyle(
                                  color: const Color(0xffc9c9c9),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                        ))),
                Expanded(child: Container()),
                Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 2) - 25,
                    decoration: BoxDecoration(
                        color: Color(0xFFC0FFD9),
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Text("Following",
                            style: const TextStyle(
                                color: const Color(0xff00a682),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center))),
              ]),
            ),

            //Profile List section
            Container(
              height: 20,
            ),

            Container(
                child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(365),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg')))),
                      Container(
                        width: 20,
                      ),
                      Text("sixtyfoldviolator",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left)
                    ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(365),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg')))),
                      Container(
                        width: 20,
                      ),
                      Text("sixtyfoldviolator",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left)
                    ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(365),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg')))),
                      Container(
                        width: 20,
                      ),
                      Text("sixtyfoldviolator",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left)
                    ])),
              ],
            )),

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
