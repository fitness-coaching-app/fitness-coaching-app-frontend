import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/search/screen/search_see_all_course_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/workouts/screens/workoutDetail_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  TextEditingController searchController = new TextEditingController();
  RangeValues _currentDurationRangeValues = const RangeValues(0, 60);
  RangeValues _currentRatingRangeValues = const RangeValues(0, 5);
  List<bool> _category = [false, false, false];
  List<bool> _body = [false, false, false];
  List<bool> _others = [false];
  @override
  Widget build(BuildContext context) {
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
                              Text("Search",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left),
                              Expanded(child: Container()),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(365),
                                      color: color_dark),
                                  child: Icon(
                                    Ionicons.scan_outline,
                                    color: color_white,
                                    size: 18,
                                  )),
                            ],
                          ),

                          //Search box
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Search for Course or People",
                                  hintStyle: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(20),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Ionicons.search,
                                            size: 25,
                                            color: color_subtitle,
                                          ))),
                                  suffixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder: (BuildContext
                                                              context,
                                                          StateSetter
                                                              setState /*You can rename this!*/) {
                                                    return SingleChildScrollView(
                                                      child: Container(
                                                        color:
                                                            Color(0xb20c2b42),
                                                        child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25, 0,
                                                                    25, 25),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Center(
                                                                        child: Icon(
                                                                      Ionicons
                                                                          .remove,
                                                                      size: 50,
                                                                      color:
                                                                          color_white,
                                                                    ))),
                                                                Text("Filters",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            26.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //category section
                                                                Text("Category",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(365),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Category 1",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _category[
                                                                              0],
                                                                          value: _category[
                                                                              0],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _category[0] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Category 2",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _category[
                                                                              1],
                                                                          value: _category[
                                                                              1],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _category[1] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Category 3",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _category[
                                                                              2],
                                                                          value: _category[
                                                                              2],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _category[2] = value!;
                                                                            });
                                                                          })
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //duration section
                                                                Text("Duration",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                RangeSlider(
                                                                  values:
                                                                      _currentDurationRangeValues,
                                                                  max: 60,
                                                                  divisions: 6,
                                                                  activeColor:
                                                                      color_teal,
                                                                  inactiveColor:
                                                                      Color(
                                                                          0xffcbcbcb),
                                                                  labels:
                                                                      RangeLabels(
                                                                    _currentDurationRangeValues
                                                                            .start
                                                                            .round()
                                                                            .toString() +
                                                                        " min",
                                                                    _currentDurationRangeValues
                                                                            .end
                                                                            .round()
                                                                            .toString() +
                                                                        " min",
                                                                  ),
                                                                  onChanged:
                                                                      (RangeValues
                                                                          values) {
                                                                    setState(
                                                                        () {
                                                                      _currentDurationRangeValues =
                                                                          values;
                                                                    });
                                                                  },
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //body parts section
                                                                Text(
                                                                    "Body Parts",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(365),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Body 1",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _body[
                                                                              0],
                                                                          value: _body[
                                                                              0],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _body[0] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Body 2",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _body[
                                                                              1],
                                                                          value: _body[
                                                                              1],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _body[1] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Body 3",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _body[
                                                                              2],
                                                                          value: _body[
                                                                              2],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _body[2] = value!;
                                                                            });
                                                                          })
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //Rating Section
                                                                Text("Rating",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                RangeSlider(
                                                                  values:
                                                                      _currentRatingRangeValues,
                                                                  max: 5,
                                                                  divisions: 5,
                                                                  activeColor:
                                                                      color_teal,
                                                                  inactiveColor:
                                                                      Color(
                                                                          0xffcbcbcb),
                                                                  labels:
                                                                      RangeLabels(
                                                                    "★ " +
                                                                        _currentRatingRangeValues
                                                                            .start
                                                                            .round()
                                                                            .toString(),
                                                                    "★ " +
                                                                        _currentRatingRangeValues
                                                                            .end
                                                                            .round()
                                                                            .toString(),
                                                                  ),
                                                                  onChanged:
                                                                      (RangeValues
                                                                          values) {
                                                                    setState(
                                                                        () {
                                                                      _currentRatingRangeValues =
                                                                          values;
                                                                    });
                                                                  },
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //others section
                                                                Text("Others",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(365),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Show only recomended for you",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _others[
                                                                              0],
                                                                          value: _others[
                                                                              0],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _others[0] = value!;
                                                                            });
                                                                          }),
                                                                      Container(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    );
                                                  });
                                                });
                                          },
                                          child: Icon(
                                            Ionicons.filter_circle_outline,
                                            size: 25,
                                            color: color_subtitle,
                                          )))),
                              controller: searchController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: (String? value) => validateEmail(value),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: color_lightGrey,
                            ),
                            padding: EdgeInsets.zero,
                          ),

                          //Course Section
                          Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Course",
                                        style: const TextStyle(
                                            color: color_dark,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.left),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchAllCourse(
                                                        searchText:
                                                            searchController
                                                                .text)),
                                          );
                                        },
                                        child: Text("See All",
                                            style: const TextStyle(
                                                color: color_dimmedTeal,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                            textAlign: TextAlign.right))
                                  ])),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: new GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkoutDetail()),
                                        );
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("TODAY'S PICK",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 18),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Container(
                                                      height: ((MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6) /
                                                          3)),
                                                  Text("Weight Loss Training",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 22),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Expanded(
                                                      child: Container(
                                                    height: 5,
                                                  )),
                                                  //time and rated row
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        //times tag
                                                        Container(
                                                            height: 24,
                                                            width: 77,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      220,
                                                                      189,
                                                                      133,
                                                                      233),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          15)),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                                    height: 13,
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Container()),
                                                                  Container(
                                                                    child: Text(
                                                                        "45 min",
                                                                        style: const TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize:
                                                                                12.0),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Container(width: 10),
                                                        //rated tag
                                                        Container(
                                                            height: 24,
                                                            width: 53,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      220,
                                                                      240,
                                                                      192,
                                                                      22),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          15)),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/Icon/Miscellaneous-Filled_star.svg',
                                                                    height: 13,
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Container()),
                                                                  Container(
                                                                    child: Text(
                                                                        "4.3",
                                                                        style: const TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize:
                                                                                12.0),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ]),
                                                ]),
                                          ))),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("TODAY'S PICK",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.left),
                                              Container(
                                                  height:
                                                      ((MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6) /
                                                          3)),
                                              Text("Weight Loss Training",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 22),
                                                  textAlign: TextAlign.left),
                                              Expanded(
                                                  child: Container(
                                                height: 5,
                                              )),
                                              //time and rated row
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    //times tag
                                                    Container(
                                                        height: 24,
                                                        width: 77,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromARGB(
                                                              220,
                                                              189,
                                                              133,
                                                              233),
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                                height: 13,
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      Container()),
                                                              Container(
                                                                child: Text(
                                                                    "45 min",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            12.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                    Container(width: 10),
                                                    //rated tag
                                                    Container(
                                                        height: 24,
                                                        width: 53,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromARGB(
                                                              220,
                                                              240,
                                                              192,
                                                              22),
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/Icon/Miscellaneous-Filled_star.svg',
                                                                height: 13,
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      Container()),
                                                              Container(
                                                                child: Text(
                                                                    "4.3",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            12.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ]),
                                            ]),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          //People Section
                          Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("People",
                                        style: const TextStyle(
                                            color: color_dark,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.left),
                                    Expanded(child: Container()),
                                    Text("See All",
                                        style: const TextStyle(
                                            color: color_dimmedTeal,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.right)
                                  ])),

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
