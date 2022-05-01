import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/userProfile/userPreference.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;
import '../../api_util.dart';
import 'newUserSetup4_comp_view.dart';

class NewUserSetupExPref2 extends StatefulWidget {
  final String gender;
  final String year;
  final String weight;
  final String height;
  final List<String>? exercisePreference;

  const NewUserSetupExPref2({
    Key? key,
    required this.gender,
    required this.year,
    required this.weight,
    required this.height,
    required this.exercisePreference,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetupExPref2State();
}

class NewUserSetupExPref2State extends State<NewUserSetupExPref2> {
  ButtonStatus nextStatus = ButtonStatus.active;

  Future<void> newUserSetup(int birthYear, String gender,
      List<String>? exercisePreference, List<String>? partToAvoid) async {
    setState(() {
      nextStatus = ButtonStatus.loading;
    });
    var response = await API.post(Environment.newUserSetupUrl, {
      "birthYear": birthYear,
        "gender": gender,
        "exercisePreference": exercisePreference,
        "partToAvoid": partToAvoid
    }, withToken: true);
    setState(() {
      nextStatus = ButtonStatus.active;
    });
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NewUserSetupComp()), (route) => false);
        });
  }

  Color _colorBorderDefault = color_lightGrey;
  Color _colorBgDefault = color_lightGrey;
  Color _colorBorderColor = color_dimmedTeal;
  Color _colorBgColor = Color(0xffdcffea);
  Color _colorBorderNeck = color_lightGrey;
  Color _colorBorderShoulder = color_lightGrey;
  Color _colorBorderHand = color_lightGrey;
  Color _colorBorderLeg = color_lightGrey;
  Color _colorBorderFoot = color_lightGrey;
  Color _colorBgNeck = color_lightGrey;
  Color _colorBgShoulder = color_lightGrey;
  Color _colorBgHand = color_lightGrey;
  Color _colorBgLeg = color_lightGrey;
  Color _colorBgFoot = color_lightGrey;

  bool selectNeck = false;
  bool selectShoulder = false;
  bool selectHand = false;
  bool selectLeg = false;
  bool selectFoot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.fromLTRB(25, 21, 25, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FCABackButton(),
        Container(
          height: 45,
        ),
        Text("Body Part To Avoid",
            style: const TextStyle(
                color: color_dark,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 28.0),
            textAlign: TextAlign.left),
        Container(
          height: 5,
        ),
        Text("Select the body part that you don’t want to workout.",
            style: const TextStyle(
                color: color_subtitle,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
        Container(
          height: 40,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectNeck == false) {
                        _colorBorderNeck = _colorBorderColor;
                        _colorBgNeck = _colorBgColor;
                        selectNeck = true;
                      } else {
                        _colorBorderNeck = _colorBorderDefault;
                        _colorBgNeck = _colorBgDefault;
                        selectNeck = false;
                      }
                    });
                  },
                  child: Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Neck",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: _colorBorderNeck, width: 3),
                          color: _colorBgNeck))))
        ]),
        Container(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectShoulder == false) {
                        _colorBorderShoulder = _colorBorderColor;
                        _colorBgShoulder = _colorBgColor;
                        selectShoulder = true;
                      } else {
                        _colorBorderShoulder = _colorBorderDefault;
                        _colorBgShoulder = _colorBgDefault;
                        selectShoulder = false;
                      }
                    });
                  },
                  child: Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Shoulder",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: _colorBorderShoulder, width: 3),
                          color: _colorBgShoulder))))
        ]),
        Container(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectHand == false) {
                        _colorBorderHand = _colorBorderColor;
                        _colorBgHand = _colorBgColor;
                        selectHand = true;
                      } else {
                        _colorBorderHand = _colorBorderDefault;
                        _colorBgHand = _colorBgDefault;
                        selectHand = false;
                      }
                    });
                  },
                  child: Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Hand",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: _colorBorderHand, width: 3),
                          color: _colorBgHand))))
        ]),
        Container(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectLeg == false) {
                        _colorBorderLeg = _colorBorderColor;
                        _colorBgLeg = _colorBgColor;
                        selectLeg = true;
                      } else {
                        _colorBorderLeg = _colorBorderDefault;
                        _colorBgLeg = _colorBgDefault;
                        selectLeg = false;
                      }
                    });
                  },
                  child: Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Leg",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: _colorBorderLeg, width: 3),
                          color: _colorBgLeg))))
        ]),
        Container(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectFoot == false) {
                        _colorBorderFoot = _colorBorderColor;
                        _colorBgFoot = _colorBgColor;
                        selectFoot = true;
                      } else {
                        _colorBorderFoot = _colorBorderDefault;
                        _colorBgFoot = _colorBgDefault;
                        selectFoot = false;
                      }
                    });
                  },
                  child: Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Foot",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: _colorBorderFoot, width: 3),
                          color: _colorBgFoot))))
        ]),
        Container(
          height: 40,
        ),
        // Next Button
        MainButtonHighlight(
            text: 'Next',
            status: nextStatus,
            onPressed: () {
              print('***\n' +
                      'year : ' +
                      widget.year +
                      '\ngender : ' +
                      widget.gender +
                      '\nexercise : ' +
                      widget.exercisePreference.toString() +
                      '\nbody : ' +
                      checkSelectBodyPart(selectNeck, selectShoulder,
                              selectHand, selectLeg, selectFoot)
                          .toString());
                  newUserSetup(
                      int.parse(widget.year),
                      widget.gender,
                      widget.exercisePreference,
                      checkSelectBodyPart(selectNeck, selectShoulder,
                          selectHand, selectLeg, selectFoot));
            }),
        SizedBox(
          height: 50
        )
      ]),
    ))));
  }

  List<String>? checkSelectBodyPart(bool selectNeck, bool selectShoulder,
      bool selectHand, bool selectLeg, bool selectFoot) {
    List<String> returnList = [];
    if (selectNeck == true) returnList.add('Neck');
    if (selectShoulder == true) returnList.add('Shoulder');
    if (selectHand == true) returnList.add('Hand');
    if (selectLeg == true) returnList.add('Leg');
    if (selectFoot == true) returnList.add('Foot');
    // print(returnList.runtimeType);
    // print('select : ' + returnList.toString());
    return returnList;
  }
}
