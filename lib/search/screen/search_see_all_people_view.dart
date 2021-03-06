import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchAllPeople extends StatefulWidget {
  final String searchText;
  const SearchAllPeople({Key? key, required this.searchText}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchAllPeopleState();
}

class SearchAllPeopleState extends State<SearchAllPeople> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String searchText = widget.searchText;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Search head section
                          Container(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Ionicons.arrow_back,
                                    size: 30,
                                    color: color_dark,
                                  )),
                              Container(
                                width: 20,
                              ),
                              Text("People",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left),
                            ],
                          ),

                          //Search result for
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text("Search Result for \"$searchText\"",
                                  style: const TextStyle(
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left)),

                          //people results
                          Container(
                              child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(365),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg')))),
                                    Container(
                                      width: 20,
                                    ),
                                    Text("sixtyfoldviolator",
                                        style: const TextStyle(
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.left)
                                  ])),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(365),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg')))),
                                    Container(
                                      width: 20,
                                    ),
                                    Text("sixtyfoldviolator",
                                        style: const TextStyle(
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.left)
                                  ])),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(365),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg')))),
                                    Container(
                                      width: 20,
                                    ),
                                    Text("sixtyfoldviolator",
                                        style: const TextStyle(
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.left)
                                  ])),
                            ],
                          )),
                        ])))));
  }
}
