import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'newUserSetup3_exPref_view.dart';
import '../../components/text_box.dart';

class NewUserSetupWeight extends StatefulWidget {
  final String gender;
  final String year;

  const NewUserSetupWeight({Key? key, required this.gender, required this.year})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetupWeightState();
}

class NewUserSetupWeightState extends State<NewUserSetupWeight> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: KeyboardAwareView(
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
                    'assets/Icon/Cartoon Illustration_weight.svg',
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
                            Text("Weight and Height",
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
                            Text("Please enter your weight and height",
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
                      TextBox(
                        keyboardType: TextInputType.number,
                        hintText: "Enter your weight",
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("kg",
                                style: const TextStyle(
                                    color: color_dimmedTeal,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.right)),
                        controller: weightController,
                      ),
                      Container(
                        height: 15,
                      ),
                      TextBox(
                        keyboardType: TextInputType.number,
                        hintText: "Enter your height",
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("cm",
                                style: const TextStyle(
                                    color: color_dimmedTeal,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.right)),
                        controller: heightController,
                      ),
                      Container(
                        height: 40,
                      ),
                      // Next Button
                      MainButtonHighlight(
                        text: 'Next',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewUserSetupExPref(
                                      gender: widget.gender,
                                      year: widget.year,
                                      weight: weightController.text,
                                      height: heightController.text,
                                    )),
                          );
                        },
                      ),
                    ]),
              )),
            ]),
          ),
        )));
  }
}
