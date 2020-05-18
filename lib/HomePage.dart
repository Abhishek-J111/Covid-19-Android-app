import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';


class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final String url = "https://brp.com.np/covid/country.php";
  List cases;
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
    print('response.body');
    setState(() {
      var data = json.decode(response.body)['countries_stat'];
      cases = data;
      cases.removeAt(0);
      isloaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: isloaded
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: cases.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Center(
                          child: AutoSizeText(
                            cases[index ]['country_name'],
                            style: GoogleFonts.lato(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600
                            ),
                            maxLines:  1,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                   decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        color: HexColor("#487EB0"),
                                      ),
                                  
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    children: <Widget>[
                                      AutoSizeText('Total Case',
                                      style: GoogleFonts.lato(
                                        fontSize: 18.0,
                                              fontWeight: FontWeight.w300,
                                      ),
                                      maxLines: 1,),
                                      AutoSizeText(
                                        cases[index]['cases'],
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
                              child: Container(
                                   decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: HexColor("#E83350")),
                                      padding: EdgeInsets.all(20.0),
                                  
                                  child: Column(
                                    children: <Widget>[
                                      AutoSizeText('Deaths',
                                      style: GoogleFonts.lato(
                                         fontSize: 18.0,
                                              fontWeight: FontWeight.w300,
                                      ),
                                      maxLines: 1,),
                                      AutoSizeText(
                                        cases[index]['deaths'],
                                        style: GoogleFonts.lato(
                                          fontSize: 18.0,
                                        ),
                                        maxLines: 1,
                                      )
                                    ],
                                  )),
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                            Expanded(
                              child: SingleChildScrollView(
                                                              child: Container(
                                   decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: HexColor("#1BCA9B"),
                                        ),
                                    
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        AutoSizeText('Recovered',
                                        style: GoogleFonts.lato(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        maxLines: 1,),
                                        AutoSizeText(
                                          cases[index]['total_recovered'],
                                          style: GoogleFonts.lato(
                                            fontSize: 18.0,
                                          ),
                                          maxLines: 1,
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
        ));
  }
}
