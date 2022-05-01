import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_people_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../api_util.dart';
import '../../environment.dart';
import '../../loading_view.dart';

enum FollowListType { Follower, Following }

class UserProfileFollowList extends StatefulWidget {
  final FollowListType type;

  const UserProfileFollowList({Key? key, required this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileFollowListState();
}

class UserProfileFollowListState extends State<UserProfileFollowList> {
  Future? fetchFuture;
  List<dynamic> list = [];

  Future<bool> fetchFollowerList() async {
    var response =
        await API.get(Environment.getFollowerListUrl, withToken: true);

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            list = r.results!;
            print(list);
          });
        });

    return true;
  }

  Future<bool> fetchFollowingList() async {
    var response =
        await API.get(Environment.getFollowingListUrl, withToken: true);

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            list = r.results!;
            print(list);
          });
        });

    return true;
  }

  Widget userCard(
      {required String displayName,
      required String profilePicture,
      required String userId}) {
    return GestureDetector(
      onTap: () {
        var userData = Hive.box('user').get('data');
        if (userData['_id'] == userId) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => UserProfile()),
              (r) => false);
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserPeopleView(userId: userId)));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(profilePicture == ""
                          ? Environment.noImageUrl
                          : profilePicture)))),
          Container(
            width: 20,
          ),
          Text(displayName,
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.left)
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == FollowListType.Follower) {
      fetchFuture = fetchFollowerList();
    } else if (widget.type == FollowListType.Following) {
      fetchFuture = fetchFollowingList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
            title: widget.type == FollowListType.Follower
                ? 'Follower'
                : 'Following',
            backButton: true),
        body: SafeArea(
          child: FutureBuilder(
            future: fetchFuture,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...(() {
                        List<Widget> users = [];
                        for (var i in list) {
                          var data;
                          print(i);
                          if (widget.type == FollowListType.Follower) {
                            data = i["followerData"][0];
                          } else if (widget.type == FollowListType.Following) {
                            data = i["followingData"][0];
                          }
                          users.add(userCard(
                              displayName: data["displayName"],
                              profilePicture: data["profilePicture"],
                              userId: data["_id"]));
                        }
                        return users;
                      }()),
                      //bottom section
                      Container(
                        height: 30,
                      ),
                    ],
                  ),
                ));
              } else {
                return Loading();
              }
            },
          ),
        ));
  }
}
