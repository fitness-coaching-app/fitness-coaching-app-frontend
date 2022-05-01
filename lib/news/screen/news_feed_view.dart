import 'package:fitness_coaching_application_test/components/build_bottom_nav_bar.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../api_util.dart';
import '../../environment.dart';
import '../../loading_view.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  List<dynamic> news = [];
  Future? newsFuture;

  Future<bool> fetchNewsFeed() async {
    var userData = Hive.box('user').get('data');
    var response = await API.get(Environment.fetchNewsUrl,
        queryParameters: {"userId": userData['_id']});
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            print(r.results!);
            news = r.results!;
          });
        });
    return true;
  }

  @override
  void initState() {
    super.initState();
    newsFuture = fetchNewsFeed();
  }

  @override
  Widget build(BuildContext context) {
    return BuildTopBottomBar(
        appBar: NormalAppBar(title: 'News'),
        body: FutureBuilder(
          future: newsFuture,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(25, 110, 25, 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //news section
                    // ...(() {
                    //   var newsArray = [];
                    //   for (var newsI in news) {
                    //     newsArray.add(NewsCard(
                    //         title: newsI["title"],
                    //         coverPicture: newsI["coverPicture"],
                    //         likeCount: newsI["likeCount"],
                    //         data: newsI["data"],
                    //         userIdLike: newsI["userIdLike"]));
                    //   }
                    //   return newsArray;
                    // }()),

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
        page: 'news');
  }
}
