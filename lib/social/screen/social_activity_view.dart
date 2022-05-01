import 'package:fitness_coaching_application_test/components/build_bottom_nav_bar.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityCard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';

import './social_leaderboard.dart';
import '../../api_util.dart';
import '../../loading_view.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityState();
}

class ActivityState extends State<Activity> {
  Future? fetchActivityFeedFuture;
  List<ActivityCard> activityFeed = [];

  Future<bool> fetchActivityFeed() async {
    var response = await API.get(Environment.activityFeedUrl, withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            var activity = r.results!;
            print(activity);
            activityFeed = [];
            var userData = Hive.box('user').get('data');
            if (activity != null) {
              for (var i in activity) {
                activityFeed.add(
                    ActivityCard(userActivity: i, ownerUserData: userData));
              }
            }
          });
        });
    return true;
  }

  Widget buildActivityFeed() {
    return RefreshIndicator(
      edgeOffset: 90,
      onRefresh: fetchActivityFeed,
      child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //activity feed
                  ...activityFeed,
                  (() {
                    if (activityFeed.isEmpty) {
                      return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text(
                              "Start following to see activity feed here."));
                    } else {
                      return Container();
                    }
                  }()),
                  //bottom section
                  Container(
                    height: 150,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchActivityFeedFuture = fetchActivityFeed();
  }


  @override
  Widget build(BuildContext context) {
    return BuildTopBottomBar(
        page: 'social',
        appBar: NormalAppBar(
          title: 'Activity',
          actionButton: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Leaderboard()));
              },
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(365),
                      color: Color(0x33000000)),
                  child: Icon(
                    Ionicons.podium,
                    color: Color(0xff000000),
                    size: 20,
                  ))),
        ),
        body: FutureBuilder(
          future: fetchActivityFeedFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return buildActivityFeed();
            }
            else {
              return Loading();
            }
          },
        )
    );
  }

  Widget buildButton(BuildContext context, String name,
      StatelessWidget screenTo) {
    return TextButton(
      onPressed: () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screenTo)),
      child: Container(
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        width: 270.0,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return Color(0xff3b5998).withOpacity(0.8);
            return Color(0xff3b5998);
          },
        ),
        splashFactory: NoSplash.splashFactory,
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.fromLTRB(30, 15, 30, 15),
        ),
      ),
    );
  }
}
