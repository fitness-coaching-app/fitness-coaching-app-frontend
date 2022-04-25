import 'dart:convert';

import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/news/widget/renderNewsArticle.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/home/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/search_see_all_course_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
