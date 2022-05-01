import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ionicons/ionicons.dart';

class RenderNewsArticle extends StatefulWidget {
  final String title;
  final String markdownString;
  final int likeCount;
  final String coverPicture;
  final bool userIdLike;

  RenderNewsArticle(
      {Key? key,
      required this.title,
      required this.markdownString,
      required this.likeCount,
      required this.coverPicture,
      required this.userIdLike})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderNewsArticleState();
}

class RenderNewsArticleState extends State<RenderNewsArticle> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
              onTap: () {},
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.coverPicture),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: 45,
                                width: 85,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(365)),
                                  color: Color(0xDDefefef),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Text(widget.likeCount.toString(),
                                            style: const TextStyle(
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            textAlign: TextAlign.right),
                                        Expanded(child: Container()),
                                        Icon(
                                          Ionicons.heart_outline,
                                          color: color_dark,
                                          size: 23,
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ))))),
                  )))),
      MarkdownBody(data: widget.markdownString)
    ]);
  }
}
