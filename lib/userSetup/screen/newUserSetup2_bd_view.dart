import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/touchable_text_box.dart';
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
  DateTime selectedYear = DateTime.now();
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
                FCABackButton(),
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
                            TouchableTextBox(
                                hintText: "Enter your birthday year",
                                controller: yearController,
                                suffixIcon: Icon(
                                  Ionicons.calendar,
                                  size: 28,
                                  color: color_dark,
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Select Year"),
                                        content: Container( // Need to use container to add size constraint.
                                          width: 300,
                                          height: 300,
                                          child: YearPicker(
                                            firstDate: DateTime(DateTime
                                                .now()
                                                .year - 100, 1),
                                            lastDate: DateTime(DateTime
                                                .now()
                                                .year, 1),
                                            initialDate: DateTime.now(),
                                            // save the selected date to _selectedDate DateTime variable.
                                            // It's used to set the previous selected date when
                                            // re-showing the dialog.
                                            selectedDate: selectedYear,
                                            onChanged: (DateTime dateTime) {
                                              // close the dialog when year is selected.
                                              selectedYear = dateTime;
                                              yearController.text = dateTime.year.toString();
                                              Navigator.pop(context);
                                              // Do something with the dateTime selected.
                                              // Remember that you need to use dateTime.year to get the year
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                            Container(
                              height: 40,
                            ),
                            // Next Button
                            MainButtonHighlight(
                              text: "Next",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewUserSetupWeight(
                                            gender: widget.gender,
                                            year: yearController.text,
                                          )),
                                );
                              },
                            ),
                          ]),
                    )),
                Expanded(child: Container()),
              ]),
            )));
  }
}
