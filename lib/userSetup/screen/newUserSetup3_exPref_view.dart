import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/userSetup/screen/newUserSetup5_exPref2_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NewUserSetupExPref extends StatefulWidget {
  final String gender;
  final String year;
  final String weight;
  final String height;
  const NewUserSetupExPref(
      {Key? key,
      required this.gender,
      required this.year,
      required this.weight,
      required this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetupExPrefState();
}

class NewUserSetupExPrefState extends State<NewUserSetupExPref> {
  Color _colorBorderDefault = color_lightGrey;
  Color _colorBgDefault = color_lightGrey;
  Color _colorBorderColor = color_dimmedTeal;
  Color _colorBgColor = Color(0xffdcffea);
  Color _colorBorderYoga = color_lightGrey;
  Color _colorBgYoga = color_lightGrey;
  Color _colorBorderCardio = color_lightGrey;
  Color _colorBgCardio = color_lightGrey;
  bool selectYoga = false;
  bool selectCardio = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FCABackButton(),
        Container(
          height: 45,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.4),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("We want to know your peferences",
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
                  Text(
                      "Select the exercise that you prefer\. You can select more than one\.",
                      style: const TextStyle(
                          color: color_subtitle,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  child: new GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectYoga == false) {
                            _colorBorderYoga = _colorBorderColor;
                            _colorBgYoga = _colorBgColor;
                            selectYoga = true;
                          } else {
                            _colorBorderYoga = _colorBorderDefault;
                            _colorBgYoga = _colorBgDefault;
                            selectYoga = false;
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
                                  child: Text("Yoga",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border:
                                  Border.all(color: _colorBorderYoga, width: 3),
                              color: _colorBgYoga))))
            ]),
            Container(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  child: new GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectCardio == false) {
                            _colorBorderCardio = _colorBorderColor;
                            _colorBgCardio = _colorBgColor;
                            selectCardio = true;
                          } else {
                            _colorBorderCardio = _colorBorderDefault;
                            _colorBgCardio = _colorBgDefault;
                            selectCardio = false;
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
                                  child: Text("Cardio",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                  color: _colorBorderCardio, width: 3),
                              color: _colorBgCardio))))
            ]),
            Container(
              height: 40,
            ),
            // Next Button
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewUserSetupExPref2(
                                gender: widget.gender,
                                year: widget.year,
                                weight: widget.weight,
                                height: widget.height,
                                exercisePreference: checkSelectPreference(
                                    selectYoga, selectCardio))),
                      );
                    },
                    child: Container(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.5),
                          child: new Text("Next",
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_teal))),
              )
            ]),
          ]),
        )),
        SizedBox(
          height: 50
        )
      ]),
    )));
  }

  List<String>? checkSelectPreference(bool selectYoga, bool selectCardio) {
    if (selectYoga == true && selectCardio == true)
      return ['yoga', 'cardio'];
    else if (selectYoga == true && selectCardio == false)
      return ['yoga'];
    else if (selectYoga == false && selectCardio == true)
      return ['cardio'];
    else
      return [];
  }
}
