import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Mainhome.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Statistics',
      debugShowCheckedModeBanner: false,

      home: HomePage(),
      
    );
  }
}