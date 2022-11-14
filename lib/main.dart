import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_parsing/model/models.dart';


void main()=>runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.orangeAccent,
      primarySwatch: Colors.red
    ),
    home: MainApp(),
  )
);

class MainApp extends StatefulWidget{
  @override
  _MainAppState createState()=>_MainAppState();
}

class _MainAppState extends State<MainApp>{
  String _jsonContent  = "";
  Future _loadSampleJson() async{
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState((){
        _jsonContent = sample.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Test",style: TextStyle(color: Colors.white))),
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: (){
                          _loadSampleJson();
                        },
                        child: Text("Read Json"))
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 16.0),
                child: Text(_jsonContent,textAlign: TextAlign.center,),)
              ],
            ),
          ),
        ) ,
      );
  }
}
