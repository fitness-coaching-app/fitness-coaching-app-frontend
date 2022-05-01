import 'package:fitness_coaching_application_test/news/widget/renderNewsArticle.dart';
import 'package:flutter/material.dart';

class NewsArticle extends StatefulWidget {
  final String title;
  final String data;
  final int likeCount;
  final String coverPicture;
  final bool userIdLike;

  const NewsArticle(
      {Key? key,
      required this.title,
      required this.data,
      required this.likeCount,
      required this.coverPicture,
      required this.userIdLike})
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
                        title: widget.title,
                        data: widget.data,
                        likeCount: widget.likeCount,
                        coverPicture: widget.coverPicture,
                        userIdLike: widget.userIdLike)))));
  }
}
