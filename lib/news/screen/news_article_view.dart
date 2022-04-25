import 'package:fitness_coaching_application_test/news/widget/renderNewsArticle.dart';
import 'package:flutter/material.dart';

class NewsArticle extends StatefulWidget {
  final String newsHeader;
  final String newsDetails;
  final String likes;
  final String picture;

  const NewsArticle(
      {Key? key,
      required this.newsHeader,
      required this.newsDetails,
      required this.likes,
      required this.picture})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NewsArticleState();
}

class NewsArticleState extends State<NewsArticle> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: RenderNewsArticle(
                        newsHeader: widget.newsHeader,
                        newsDetails: widget.newsDetails,
                        likes: widget.likes,
                        picture: widget.picture)))));
  }
}
