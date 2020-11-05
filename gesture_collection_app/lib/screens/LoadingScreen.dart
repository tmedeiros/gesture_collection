import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gesture_collection_app/screens/SpeechCollectScreen.dart';

class LoadingScreen extends StatefulWidget {
  static const String routeName = "/loading";

  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Loading..."),
              Padding(padding: EdgeInsets.only(top:20.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.yellow,
                strokeWidth: 1,
              )
            ]
          )
    ));
  }

  //temporary timer until real loading implemented
  startTime() async{
    var duration = new Duration(seconds: 8);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SpeechCollectScreen()
    )
    );
  }
}
