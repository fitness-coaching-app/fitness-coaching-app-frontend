import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../environment.dart';

class RenderTopThree extends StatefulWidget {
  final List<String> rank;
  final List<String> username;
  final List<String> score;
  final List<String> urls;

  RenderTopThree({
    Key? key,
    required this.rank,
    required this.username,
    required this.score,
    required this.urls,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderTopThreeState();
}

class RenderTopThreeState extends State<RenderTopThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        if (widget.username.length > 0)
          Positioned(
              left: MediaQuery.of(context).size.width / 3 - 20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width / 3.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Text(widget.rank[0],
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.center),
                    Expanded(child: Container()),
                    SvgPicture.asset(
                      'assets/Icon/Cartoon Illustration_crown.svg',
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Expanded(child: Container()),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Center(
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.26,
                                    height: MediaQuery.of(context).size.height *
                                        0.13,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.urls[0] == ""
                                                  ? Environment.noImageUrl
                                                  : widget.urls[0]),
                                          fit: BoxFit.cover,
                                        )))))),
                    Expanded(child: Container()),
                    Text(
                        widget.username[0] != null
                            ? widget.username[0]
                            : "username",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.center),
                    Expanded(child: Container()),
                    Text(widget.score[0] != null ? widget.score[0] : "0",
                        style: const TextStyle(
                            color: color_dimmedTeal,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.center)
                  ],
                ),
              )),
        if (widget.username.length > 1)
          Positioned(
              bottom: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Text(widget.rank[1] != null ? widget.rank[1] : "2",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                      Expanded(child: Container()),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.24,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                widget.urls[1] == ""
                                                    ? Environment.noImageUrl
                                                    : widget.urls[1]),
                                            fit: BoxFit.cover,
                                          )))))),
                      Expanded(child: Container()),
                      Text(
                          widget.username[1] != null
                              ? widget.username[1]
                              : "username",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                      Expanded(child: Container()),
                      Text(widget.score[1] != null ? widget.score[1] : "0",
                          style: const TextStyle(
                              color: color_dimmedTeal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
        if (widget.username.length > 2)
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Text(widget.rank[2] != null ? widget.rank[2] : "3",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                      Expanded(child: Container()),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.24,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                widget.urls[2] == ""
                                                    ? Environment.noImageUrl
                                                    : widget.urls[2]),
                                            fit: BoxFit.cover,
                                          )))))),
                      Expanded(child: Container()),
                      Text(
                          widget.username[2] != null
                              ? widget.username[2]
                              : "username",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                      Expanded(child: Container()),
                      Text(widget.score[2] != null ? widget.score[2] : "0",
                          style: const TextStyle(
                              color: color_dimmedTeal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center)
                    ],
                  ))),
      ]),
    );
  }
}
