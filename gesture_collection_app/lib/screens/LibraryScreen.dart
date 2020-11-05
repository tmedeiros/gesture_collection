import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

class LibraryScreen extends StatelessWidget {
  static const String routeName = "/library";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBarWidget(
        height: 300,
        title: "Gesture Library",
        backlink: "/speech",
        navEnabled: true,
      ),
      body: Container(
          child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/individualgesture/1");
                }),
            //TODO: Implement list of gestures using labels.dart
            //TODO: Create individual gesture widget
          )),
    );
  }
}