import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/search/screen/search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchingState();
}

class SearchingState extends State<Searching> {
  TextEditingController searchController = new TextEditingController();
  RangeValues _currentDurationRangeValues = const RangeValues(0, 60);
  RangeValues _currentRatingRangeValues = const RangeValues(0, 5);
  List<bool> _category = [false, false, false];
  List<bool> _body = [false, false, false];
  List<bool> _others = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
          title: 'Search',
          backButton: true,
          actionButton: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(365), color: color_dark),
              child: Icon(
                Ionicons.scan_outline,
                color: color_white,
                size: 18,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBox(
                              hintText: 'Search for Course or People',
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Ionicons.search,
                                        size: 25,
                                        color: color_subtitle,
                                      )))),
                          SizedBox(height: 10),
                          SearchResult(users: [], courses: [])
                        ])))));
  }
}
