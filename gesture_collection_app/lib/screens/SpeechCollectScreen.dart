import 'package:flutter/material.dart';

class SpeechCollectScreen extends StatelessWidget {
  static const String routeName = "/speechcollect";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10.0)),
              Text("TEST POST PLS IGNORE"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.grey[300],
                        backgroundColor: Colors.grey ,
                        minimumSize: Size(300, 300)),
                    child: Text("Speech"),
                    onPressed: () {
                        Navigator.of(context).pushNamed("/speech");
                    }),
                  )],
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.grey[300],
                      backgroundColor: Colors.grey,
                      minimumSize: Size(300, 300) ),
                    child: Text("Collect"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/collect");
                    }),
              )],),
            ]),
          ),
    );
  }
}