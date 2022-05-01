import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/news/screen/news_article_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NewsCard extends StatefulWidget {
  final String title;
  final String coverPicture;
  final int likeCount;
  final String data;
  final bool userIdLike;

  NewsCard(
      {Key? key,
      required this.title,
      required this.coverPicture,
      required this.likeCount,
      required this.data,
      required this.userIdLike})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NewsCardState();
}

class NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsArticle(
                        title: widget.title,
                        data: widget.data,
                        likeCount: widget.likeCount,
                        coverPicture: widget.coverPicture,
                        userIdLike: widget.userIdLike)),
              );
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.coverPicture),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0),
                              textAlign: TextAlign.left),
                          Container(
                            height: 10,
                          ),
                          Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xDDefefef),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Ionicons.heart,
                                        color: widget.userIdLike
                                            ? color_red
                                            : color_dark,
                                        size: 20,
                                      ),
                                      Expanded(child: Container()),
                                      Text(widget.likeCount.toString(),
                                          style: const TextStyle(
                                              color: color_dark,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Poppins",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left),
                                      Expanded(child: Container()),
                                    ],
                                  ))),
                        ])))));
  }
}
