import 'package:fitness_coaching_application_test/RenderBottomNav.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/news/newsFeed.dart';
import 'package:fitness_coaching_application_test/news/widget/NewsCard.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  List<String> newsHeader = [];
  List<String> newsDetails = [];
  List<String> likes = [];
  List<String> picture = [];
  List<String> onClickAction = [];
  final news = newsFeedFromJson(
      "\{\"results\": \[\{\"newsHeader\": \"6 ท่าบริหาร เสริมสร้างปอดแข็งแรง\",\"newsDetails\": \"test1\",\"likes\": 2530,\"picture\": \"https://i.pinimg.com/474x/7c/4d/15/7c4d1533480bb4c5911d95699fef5186.jpg\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"ออกกำลังกายยังไงให้น้ำหนักลด\",\"newsDetails\": \"test2\",\"likes\": 200,\"picture\": \"https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"อาหารเพื่อสุขภาพสำหรับนักกีฬา\",\"newsDetails\": \"test3\",\"likes\": 1234,\"picture\": \"https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"แกว่งแขนอย่างไรให้ได้สุขภาพ\",\"newsDetails\": \"test4\",\"likes\": 52,\"picture\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC4q5-ZpLXcl_Cd8j_PONvAQC1l7pVX35u6w&usqp=CAU\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"อยากมีสุขภาพดีต้องทำอย่างไร\",\"newsDetails\": \"test5\",\"likes\": 14,\"picture\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5YkEJmFjWNPbIANu5itMzRPLZabNlPIkoQ&usqp=CAU\"\,\"onClickAction\": \"open --news=15aruv210c\"}\]\}");
  @override
  Widget build(BuildContext context) {
    for (var i in news.results) {
      newsHeader.add(i.newsHeader.toString());
      newsDetails.add(i.newsDetails.toString());
      likes.add(i.likes.toString());
      picture.add(i.picture.toString());
      onClickAction.add(i.onClickAction.toString());
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
                //profile head section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("News",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left),
                    Expanded(child: Container()),
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(365)),
                        child: Icon(
                          Ionicons.filter_circle,
                          color: color_dark,
                          size: 30,
                        )),
                  ],
                ),

                Container(
                  height: 10,
                ),

                //news section
                for (var i = 0; i < news.results.length; i++)
                  NewsCard(
                      newsHeader: newsHeader[i],
                      newsDetails: newsDetails[i],
                      likes: likes[i],
                      picture: picture[i]),

                //bottom section
                Container(
                  height: 30,
                ),
              ],
            ),
          )),
        ),
        bottomNavigationBar: RenderBottomNav(
          page: 'news',
        ));
  }
}
