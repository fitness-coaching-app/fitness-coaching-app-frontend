import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/search/screen/search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchingState();
}

class SearchingState extends State<Searching> {
  TextEditingController searchController = new TextEditingController();
  List<dynamic> courses = [];
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    Future<bool> search() async {
      if (searchController.text.isEmpty) {
        return true;
      }
      var response = await API.get(Environment.searchUrl,
          withToken: true, queryParameters: {'q': searchController.text});
      API.responseAlertWhenError(
          context: context,
          response: response,
          whenSuccess: (r) {
            setState(() {
              users = r.results!["users"];
              courses = r.results!["courses"];
            });
          });

      return true;
    }

    return Scaffold(
        appBar: NormalAppBar(
          title: 'Search',
          backButton: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: TextBox(
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      search();
                    },
                    controller: searchController,
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
              ),
              SizedBox(height: 10),
              SearchResult(users: users, courses: courses)
            ]))));
  }
}
