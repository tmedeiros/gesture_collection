import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

class PlayAudioScreen extends StatelessWidget {
  static const String routeName = "/playaudio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBarWidget(
        height: 300,
        title: "Playing Audio...",
        backlink: "/speech",
        navEnabled: true,
      ),
      body: Container(
          child: Center(
            child: Text("PLay Audio Screen"),
          )),
    );
  }
}