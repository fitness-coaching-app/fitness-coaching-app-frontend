import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';

class ReactionsBarV2 extends StatefulWidget {
  final String activityId;
  int reactionCount;
  int commentCount;
  bool isReacted;
  final Function onUpdate;

  ReactionsBarV2(
      {Key? key,
      required this.activityId,
      required this.reactionCount,
      required this.commentCount,
      required this.isReacted,
      required this.onUpdate})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ReactionsBarV2State();
}

class ReactionsBarV2State extends State<ReactionsBarV2> {
  TextEditingController commentController = new TextEditingController();
  bool showCommentTextBox = false;

  Future<void> update(r) async {
    await widget.onUpdate();
    setState((){});
  }
  Future<void> addReaction() async {
    var response = await API.get(Environment.addReactionUrl(activityId: widget.activityId), withToken: true, queryParameters: {"reaction": "LOVE"});
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: update);
  }

  Future<void> removeReaction() async {
    var response = await API.get(Environment.removeReactionUrl(activityId: widget.activityId), withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: update);
  }

  Future<void> addComment() async {
    var response = await API.post(Environment.addCommentUrl(activityId: widget.activityId), {"comment": commentController.text}, withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: update);
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.isReacted) {
                        widget.reactionCount--;
                        removeReaction();
                      } else {
                        widget.reactionCount++;
                        addReaction();
                      }
                      widget.isReacted = !widget.isReacted;
                    });
                  },
                  child: Container(
                    width: 50,
                    child: Row(
                      children: [
                        (() {
                          if (widget.isReacted) {
                            return Icon(
                              Ionicons.heart,
                              color: color_red,
                              size: 25,
                            );
                          } else {
                            return Icon(
                              Ionicons.heart_outline,
                              color: color_subtitle,
                              size: 25,
                            );
                          }
                        }()),
                        Container(
                          width: 10,
                        ),
                        Text(widget.reactionCount.toString(),
                            style: TextStyle(
                                color: widget.isReacted
                                    ? color_red
                                    : color_subtitle,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 35,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showCommentTextBox = !showCommentTextBox;
                    });
                  },
                  child: Container(
                    width: 50,
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.chatbubble_outline,
                          color: color_subtitle,
                          size: 25,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(widget.commentCount.toString(),
                            style: const TextStyle(
                                color: color_subtitle,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
