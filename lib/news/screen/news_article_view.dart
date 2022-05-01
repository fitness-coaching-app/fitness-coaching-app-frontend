import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/news/widget/renderNewsArticle.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../loading_view.dart';

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
  String markdownString = "";
  Future? newsLoadingFuture;

  Future<bool> loadNews() async {
    final directory = await getApplicationDocumentsDirectory();
    final downloadPath = '${directory.path}/news/news.md';
    await Dio().download(widget.data, downloadPath);

    var file = File(downloadPath);
    markdownString = await file.readAsString();
    return true;
  }

  @override
  void initState() {
    super.initState();
    newsLoadingFuture = loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: NormalAppBar(
          title: "News Article",
          backButton: true,
        ),
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: FutureBuilder(
                    future: newsLoadingFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return RenderNewsArticle(
                            title: widget.title,
                            markdownString: markdownString,
                            likeCount: widget.likeCount,
                            coverPicture: widget.coverPicture,
                            userIdLike: widget.userIdLike);
                      } else {
                        return Loading();
                      }
                    },
                  )),
            )));
  }
}
