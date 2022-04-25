import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/news/screen/news_article_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NewsCard extends StatefulWidget {
  final String newsHeader;
  final String newsDetails;
  final String likes;
  final String picture;

  NewsCard(
      {Key? key,
      required this.newsHeader,
      required this.newsDetails,
      required this.likes,
      required this.picture})
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
                        newsHeader: widget.newsHeader,
                        newsDetails: widget.newsDetails,
                        likes: widget.likes,
                        picture: widget.picture)),
              );
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.picture),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.newsHeader,
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
                                        color: color_dark,
                                        size: 20,
                                      ),
                                      Expanded(child: Container()),
                                      Text(widget.likes,
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
                          Expanded(child: Container()),
                          Text(widget.newsDetails,
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left)
                        ])))));
  }
}
