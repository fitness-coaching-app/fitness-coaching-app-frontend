import 'package:fitness_coaching_application_test/RenderBottomNav.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/social/screen/social_leaderboard_following_view.dart';
import 'package:fitness_coaching_application_test/social/social_activity.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityCard.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityState();
}

class ActivityState extends State<Activity> {
  List<String> actHeader = [];
  List<String> actDetail = [];
  List<String> username = [];
  List<String> iconUrl = [];
  List<String> urls = [];
  List<List<List<String>>> likes = [
    [
      ["username1", "username2", "username1", "username2"],
      ["like", "haha", "like", "haha"]
    ],
    [],
    [],
    [],
    []
  ];
  List<int> likeCnt = [2, 2, 2, 2, 2];
  List<List<List<String>>> comments = [
    [
      ["username1", "username2"],
      ["comments1", "comments2"],
      ["username1", "username2"],
    ],
    [],
    [],
    [],
    []
  ];
  List<int> commentCnt = [2, 2, 2, 2, 2];
  List<String> picture = [];
  List<String> onClickAction = [];
  List<String> updateOn = [
    "2022-04-06 20:18:04Z",
    "2022-04-05 20:18:04Z",
    "2022-04-04 20:18:04Z",
    "2022-04-03 20:18:04Z",
    "2022-04-02 20:18:04Z"
  ];
  List<String> updateToNow = [];
  final activityFeed = activityFeedFromJson(
      "\{\"results\": \[\{\"actHeader\": \"Course Completed\",\"actDetail\": \"Weight Loss Training\",\"username\": \"username1\",\"iconUrl\" : \"https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg\",\"urls\": \"https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg\",\"likes\": \[\{\"username\": \"username1\"\},\{\"username\" : \"username2\"\}\],\"comments\" : \[\{\"commentData\" : \"comment1\"\},\{\"commentData\" : \"comment2\"\}\],\"picture\" : \"https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg\",\"onClickAction\" : \"open -ABCDE\"\},\{\"actHeader\": \"Course Completed\",\"actDetail\": \"Body Combat Training\",\"username\": \"username2\",\"iconUrl\" : \"https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg\",\"urls\": \"https://i.pinimg.com/474x/7c/4d/15/7c4d1533480bb4c5911d95699fef5186.jpg\",\"likes\": \[\{\"username\": \"username1\"\},\{\"username\" : \"username2\"\}\],\"comments\" : \[\{\"commentData\" : \"comment1\"\},\{\"commentData\" : \"comment2\"\}\],\"picture\" : \"https://i.pinimg.com/474x/7c/4d/15/7c4d1533480bb4c5911d95699fef5186.jpg\",\"onClickAction\" : \"open -ABCDE\"\},\{\"actHeader\": \"Level Up\",\"actDetail\": \"Level up to Level 3\",\"username\": \"username3\",\"iconUrl\" : \"https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg\",\"urls\": \"https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg\",\"likes\": \[\{\"username\": \"username1\"\},\{\"username\" : \"username2\"\}\],\"comments\" : \[\{\"commentData\" : \"comment1\"\},\{\"commentData\" : \"comment2\"\}\],\"picture\" : \"https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg\",\"onClickAction\" : \"open -ABCDE\"\},\{\"actHeader\": \"Course Completed\",\"actDetail\": \"Cardio Training\",\"username\": \"username4\",\"iconUrl\" : \"https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg\",\"urls\": \"https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg\",\"likes\": \[\{\"username\": \"username1\"\},\{\"username\" : \"username2\"\}\],\"comments\" : \[\{\"commentData\" : \"comment1\"\},\{\"commentData\" : \"comment2\"\}\],\"picture\" : \"https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg\",\"onClickAction\" : \"open -ABCDE\"\},\{\"actHeader\": \"Course Completed\",\"actDetail\": \"Basic Training\",\"username\": \"username5\",\"iconUrl\" : \"https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg\",\"urls\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5YkEJmFjWNPbIANu5itMzRPLZabNlPIkoQ&usqp=CAU\",\"likes\": \[\{\"username\": \"username1\"\},\{\"username\" : \"username2\"\}\],\"comments\" : \[\{\"commentData\" : \"comment1\"\},\{\"commentData\" : \"comment2\"\}\],\"picture\" : \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5YkEJmFjWNPbIANu5itMzRPLZabNlPIkoQ&usqp=CAU\",\"onClickAction\" : \"open -ABCDE\"\}\]\}");

  @override
  Widget build(BuildContext context) {
    //datetime difference from now
    DateTime dateNow = DateTime.now();
    for (var i in updateOn) {
      DateTime a = DateTime.parse(i);
      String b = dateNow.difference(a).inHours.toString();
      updateToNow.add(b);
    }

    //from json add to list of string for display
    for (var i in activityFeed.results) {
      actHeader.add(i.actHeader);
      actDetail.add(i.actDetail);
      username.add(i.username);
      iconUrl.add(i.iconUrl);
      urls.add(i.urls);
      picture.add(i.picture);
      onClickAction.add(i.onClickAction);
    }
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
                //activity head section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Activity",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left),
                    Expanded(child: Container()),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LeaderboardFollowing()));
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
                  ],
                ),

                Container(
                  height: 10,
                ),

                //activity feed
                for (var i = 0; i < activityFeed.results.length; i++)
                  ActivityCard(
                    actDetail: actDetail[i],
                    actHeader: actHeader[i],
                    commentCnt: commentCnt[i],
                    comments: comments[i],
                    iconUrl: iconUrl[i],
                    likeCnt: likeCnt[i],
                    likes: likes[i],
                    onClickAction: onClickAction[i],
                    picture: picture[i],
                    updateOn: updateOn[i],
                    updateToNow: updateToNow[i],
                    urls: urls[i],
                    username: username[i],
                  ),

                //bottom section
                Container(
                  height: 30,
                ),
              ],
            ),
          )),
        ),
        bottomNavigationBar: RenderBottomNav(
          page: 'social',
        ));
  }

  Widget buildButton(
      BuildContext context, String name, StatelessWidget screenTo) {
    return TextButton(
      onPressed: () => Navigator.push(
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
