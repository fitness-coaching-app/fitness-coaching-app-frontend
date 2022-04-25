import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RenderNewsArticle extends StatefulWidget {
  final String newsHeader;
  final String newsDetails;
  final String likes;
  final String picture;

  RenderNewsArticle({
    Key? key,
    required this.newsHeader,
    required this.newsDetails,
    required this.likes,
    required this.picture,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderNewsArticleState();
}

class RenderNewsArticleState extends State<RenderNewsArticle> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 21,
      ),
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Ionicons.arrow_back,
            size: 30,
            color: color_dark,
          )),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
              onTap: () {},
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
                                        Text(widget.likes,
                                            style: const TextStyle(
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            textAlign: TextAlign.right),
                                        Expanded(child: Container()),
                                        Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(365),
                                                color: const Color(0x11000000)),
                                            child: Icon(
                                              Ionicons.heart_outline,
                                              color: color_dark,
                                              size: 23,
                                            )),
                                        Expanded(child: Container()),
                                      ],
                                    ))))),
                  )))),
      Text(widget.newsHeader,
          style: const TextStyle(
              color: color_dark,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 20.0),
          textAlign: TextAlign.left),
      Container(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Text(widget.newsDetails,
          style: const TextStyle(
              color: const Color(0xff000000),
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.left)
    ]);
  }
}
