import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

class SpeechScreen extends StatelessWidget {
  static const String routeName = "/speech";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBarWidget(
        height: 300,
        title: "",
        backlink: "/speechcollect",
        forwardLink: "/library",
        actionEnabled: true,
        navEnabled: true,
      ),
      body: Container(
          child: Column(
            children: [
              Center(
                child: Text("Instructions go here"),
              ),
              Padding(padding: EdgeInsets.all(85.0)),
              Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.grey[300],
                        backgroundColor: Colors.grey ,
                        minimumSize: Size(300, 150)),
                    child: Text("Speech"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/recordgesture", arguments: {'nextLink': '/playaudio'});
                    }),
              )
            ],
          ),

      ));
  }
}