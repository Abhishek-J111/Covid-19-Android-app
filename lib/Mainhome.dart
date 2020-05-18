import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Nepal.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _pageOptions = [Nepal(),HomePage1()];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Covid Tracker',
            style: GoogleFonts.lato(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          // backgroundColor: HexColor("#2475B0"),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              title: AutoSizeText("Nepal",
              style: GoogleFonts.lato(
                fontSize: 18.0,
                
              ),
              maxLines: 1,
              )
              ),
              BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.globe),
              title: AutoSizeText("World",
              style: GoogleFonts.lato(
                fontSize: 18.0,
                
              ),
              maxLines: 1,
              )
              ),
                
          ]     
               ),
          );
          
        
  }
}
