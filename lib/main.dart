import 'package:flutter/material.dart';
import 'Mainhome.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:HexColor("#2475B0"),     
      ),

      home: HomePage(),
      
    );
  }
}