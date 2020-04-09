import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HomePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://brp.com.np/covid/nepal.php";
  
  List cases;
  List casesall;
  bool isloaded = true;

 _nextpage() {

   Navigator.push(context, 
   MaterialPageRoute(
     builder: (context) => HomePage1(),
   )
   
   );

}
  @override
  void initState(){
    super.initState();
    this.GetData();
  }
  

  Future GetData() async {
    var response = await http.get(
      Uri.encodeFull(url),);
      
      print('response.body');
    setState(() {
      var data = json.decode(response.body)['latest_stat_by_country'];
      
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
          itemCount:1,
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
                               Text('Total Case',style: TextStyle(
                                 fontSize: 15.0
                               ),),
                               Text(
                         cases[index]['total_cases'],
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
                         cases[index]['total_deaths'],
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
                  
                   ),
                   
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 200.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                     child: RaisedButton(

                      onPressed: _nextpage,
                      child: Text('View All Data'),
                      
                      ),
                      
                  ),
                  ],
            
                   
              
            );
      
          }

          ),
          
        
      )
      
    
    );
  }
}