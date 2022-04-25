import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'newUserSetup3_weight_view.dart';

class NewUserSetupBd extends StatefulWidget {
  final String gender;
  const NewUserSetupBd({Key? key, required this.gender}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetupBdState();
}

class NewUserSetupBdState extends State<NewUserSetupBd> {
  TextEditingController yearController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  'assets/Icon/Cartoon Illustration_bd.svg',
                  height: 100,
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.4),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("When Is Your Birthday",
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26.0),
                              textAlign: TextAlign.left),
                          Container(
                            height: 5,
                          ),
                          Text("Please enter your year of birth",
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
                    Container(
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter your birthday year",
                          hintStyle: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                          suffixIcon: Icon(
                            Ionicons.calendar,
                            size: 28,
                            color: color_dark,
                          ),
                        ),
                        controller: yearController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (String? value) => validateEmail(value),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: color_lightGrey,
                      ),
                      padding: EdgeInsets.zero,
                    ),
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
                                    builder: (context) => NewUserSetupWeight(
                                          gender: widget.gender,
                                          year: yearController.text,
                                        )),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: color_teal))),
                      )
                    ]),
                  ]),
            )),
            Expanded(child: Container()),
          ]),
        )));
  }
}
