import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final String url = "https://brp.com.np/covid/country.php";
  List cases;
  bool isloaded = true;


  @override
  void initState(){
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
      cases=data;
      isloaded= false;
      
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Stat'),
      ),
      body: Center(
        child: isloaded? CircularProgressIndicator() :
         ListView.builder(
          itemCount:cases.length,
          itemBuilder: (context , index) {
            return Column(
              
                
                  children: <Widget>[
                    
                   Center(
                     child: Text(
                       cases[index]['country_name'],
                       style: TextStyle(
                         fontSize: 20.0,
                       ),
                     ),
                   ),
                   Row(
                     children: <Widget>[
                       Expanded(
                                                child: Container(
                           color: Colors.blue,
                           padding: EdgeInsets.all(20.0),
                           child: Column(
                             children: <Widget>[
                               Text('Total Case'),
                               Text(
                         cases[index]['cases'],
                         style: TextStyle(
                           fontSize: 20.0,
                           
                         ),)
                             ],
                           )
                           
                         ),
                       ),
                       Padding(padding: EdgeInsets.all(5.0)),
                       Expanded(
                                                child: Container(
                           color: Colors.red,
                           padding: EdgeInsets.all(20.0),
                           child: Column(
                             children: <Widget>[
                               Text('Deaths'),
                               Text(
                         cases[index]['deaths'],
                         style: TextStyle(
                           fontSize: 25.0,
                           
                         ),)
                             ],
                           )
                           
                         ),
                       ),
                       Padding(padding: EdgeInsets.all(5.0)),
                       Expanded(
                                                child: Container(
                           color: Colors.green,
                           padding: EdgeInsets.all(20.0),
                           child: Column(
                             children: <Widget>[
                               Text('Recovered'),
                               Text(
                         cases[index]['total_recovered'],
                         style: TextStyle(
                           fontSize: 23.0,
                           
                         ),)
                             ],
                           )
                           
                         ),
                       ),
                       
                       
                     ],
                   )
                   
                  ],
                  
               
              
                   
              
            );
          }

          ),
      )
    );
  }
}