import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

class Nepal extends StatefulWidget {
  @override
  _NepalState createState() => _NepalState();
}

class _NepalState extends State<Nepal> {
  final String url = "https://brp.com.np/covid/nepal.php";
  final String url1 = "https://brp.com.np/covid/alldata.php";

  List cases;
  var total_cases;
  var active_cases;
  var recovered;
  var total_deaths;
  var new_cases;

  bool isloaded = true;
  @override
  void initState() {
    super.initState();
    this.GetData();
  }

  Future GetData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    var worldresponse = await http.get(
      Uri.encodeFull(url1),
      );

    // print(response.body);
    // print(worldresponse.body);
    setState(() {
      var data = json.decode(response.body)['latest_stat_by_country'];
      var total = json.decode(worldresponse.body)["total_cases"];
      var death = json.decode(worldresponse.body)["total_deaths"];
      var  worldrecovered= json.decode(worldresponse.body)["total_recovered"];
      var newcases = json.decode(worldresponse.body)["new_cases"];
      var activecase = json.decode(worldresponse.body)["active_cases"];
      cases = data;
      total_cases = total;
      total_deaths = death;
      active_cases = activecase;
      new_cases = newcases;
      recovered = worldrecovered;
      isloaded = false;
    });
  }

  _launchUrl() async {
    const String url = "https://mohp.gov.np/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Couldn\'t Open the Site $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isloaded
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SafeArea(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                               Center(
                                child: AutoSizeText(
                                  "World",
                                  style: GoogleFonts.lato(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top:10.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#487EB0"),
                                        ),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'Total Case',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              total_cases,
                                              style: GoogleFonts.lato(
                                                  fontSize: 18.0),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: HexColor("#E83350")),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'Deaths',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              total_deaths,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                               Padding(padding: EdgeInsets.all(10.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#1BCA9B"),
                                        ),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'Recovered',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              recovered,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#FF3031"),
                                        ),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'New Cases',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              new_cases,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
    
                              Padding(padding: EdgeInsets.only(top:10.0)),
                              Center(
                                child: AutoSizeText(
                                  cases[index]['country_name'],
                                  style: GoogleFonts.lato(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#487EB0"),
                                        ),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'Total Case',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              cases[index]['total_cases'],
                                              style: GoogleFonts.lato(
                                                  fontSize: 18.0),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: HexColor("#E83350")),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'Deaths',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              cases[index]['total_deaths'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#1BCA9B"),
                                        ),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'Recovered',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              cases[index]['total_recovered'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(padding: EdgeInsets.all(5.0)),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#FF3031"),
                                        ),
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              'New Cases',
                                              style: GoogleFonts.lato(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            AutoSizeText(
                                              cases[index]['new_cases'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: _launchUrl,
                                      child: SingleChildScrollView(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: HexColor("#1287A5"),
                                          ),
                                          padding: EdgeInsets.all(20.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  AutoSizeText(
                                                    'For more information',
                                                    style: GoogleFonts.lato(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                              SingleChildScrollView(
                                                child: Row(children: <Widget>[
                                                  FaIcon(FontAwesomeIcons.home),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0)),
                                                  SingleChildScrollView(
                                                    child: AutoSizeText(
                                                      "Ministry of Health & Population",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )));
                },
              ),
      ),
    );
  }
}
