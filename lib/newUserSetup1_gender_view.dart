import 'package:flutter/material.dart';
import 'package:flutter_application_2/newUserSetup2_bd_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUserSetupGender extends StatefulWidget {
  const NewUserSetupGender({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetupGenderState();
}

class NewUserSetupGenderState extends State<NewUserSetupGender> {
  Color _colorBorderDefault = color_lightGrey;
  Color _colorBgDefault = color_lightGrey;
  Color _colorBorderColor = color_dimmedTeal;
  Color _colorBgColor = Color(0xffdcffea);
  Color _colorBorderM = color_lightGrey;
  Color _colorBgM = color_lightGrey;
  Color _colorBorderF = color_lightGrey;
  Color _colorBgF = color_lightGrey;
  Color _colorBorderO = color_lightGrey;
  Color _colorBgO = color_lightGrey;
  bool _selectM = false;
  bool _selectF = false;
  bool _selectO = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Ionicons.arrow_back,
                      size: 30,
                      color: color_dark,
                    )),
                Container(
                  height: 45,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.4),
                    child: new SvgPicture.asset(
                      'assets/Icon/Cartoon Illustration_genders1.svg',
                      height: 100,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("What’s Your Gender",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 40,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: new GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _colorBgF = _colorBgDefault;
                                        _colorBgM = _colorBgColor;
                                        _colorBgO = _colorBgDefault;
                                        _colorBorderF = _colorBorderDefault;
                                        _colorBorderM = _colorBorderColor;
                                        _colorBorderO = _colorBorderDefault;

                                        _selectM = true;
                                        _selectF = false;
                                        _selectO = false;
                                      });
                                    },
                                    child: Container(
                                        height: 80,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Ionicons.male,
                                                color: Color.fromRGBO(
                                                    4, 151, 214, 1),
                                                size: 48,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              // Text
                                              Text("Male",
                                                  style: const TextStyle(
                                                      color: color_dark,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            border: Border.all(
                                                color: _colorBorderM, width: 3),
                                            color: _colorBgM))))
                          ]),
                      Container(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: new GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _colorBgF = _colorBgColor;
                                        _colorBgM = _colorBgDefault;
                                        _colorBgO = _colorBgDefault;
                                        _colorBorderF = _colorBorderColor;
                                        _colorBorderM = _colorBorderDefault;
                                        _colorBorderO = _colorBorderDefault;

                                        _selectM = false;
                                        _selectF = true;
                                        _selectO = false;
                                      });
                                    },
                                    child: Container(
                                        height: 80,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Ionicons.female,
                                                color: Color.fromRGBO(
                                                    255, 72, 226, 1),
                                                size: 48,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              // Text
                                              Text("Female",
                                                  style: const TextStyle(
                                                      color: color_dark,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left),
                                              Container(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            border: Border.all(
                                                color: _colorBorderF, width: 3),
                                            color: _colorBgF))))
                          ]),
                      Container(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: new GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _colorBgF = _colorBgDefault;
                                        _colorBgM = _colorBgDefault;
                                        _colorBgO = _colorBgColor;
                                        _colorBorderF = _colorBorderDefault;
                                        _colorBorderM = _colorBorderDefault;
                                        _colorBorderO = _colorBorderColor;

                                        _selectM = false;
                                        _selectF = false;
                                        _selectO = true;
                                      });
                                    },
                                    child: Container(
                                        height: 80,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Ionicons.male_female,
                                                size: 48,
                                                color: Color.fromRGBO(
                                                    184, 12, 244, 1),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              // Text
                                              Text("Other",
                                                  style: const TextStyle(
                                                      color: color_dark,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            border: Border.all(
                                                color: _colorBorderO, width: 3),
                                            color: _colorBgO))))
                          ]),
                      Container(
                        height: 40,
                      ),
                      // Next Button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: new GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewUserSetupBd(
                                                gender: genderSelect(_selectM,
                                                    _selectF, _selectO),
                                              )),
                                    );
                                  },
                                  child: Container(
                                      height: 60,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.5),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: color_teal))),
                            )
                          ]),
                    ],
                  ),
                )),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }

  String genderSelect(bool male, bool female, bool other) {
    if (male == true && female == false && other == false) {
      print("select MALE");
      return "MALE";
    } else if (male == false && female == true && other == false) {
      print("select FEMALE");
      return "FEMALE";
    } else if (male == false && female == false && other == true) {
      print("select OTHER");
      return "OTHER";
    } else {
      print("not select");
      return "not select";
    }
  }
}
