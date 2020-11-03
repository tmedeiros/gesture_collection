import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

class IndividualGestureScreen extends StatelessWidget {
  static const String routeName = "/individualgesture/{}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBarWidget(
        height: 300,
        title: "Gesture 1",
        backlink: "/library",
        navEnabled: true,

      ),
      body: Container(
          child: Center(
            child: Text("Individual Gesture Screen"),
          )),
    );
  }
}