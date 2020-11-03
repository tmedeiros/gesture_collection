import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

class PlayAudioScreen extends StatefulWidget {
  static const String routeName = "/playaudio";

  @override
  _PlayAudioScreenState createState() => _PlayAudioScreenState();
}

class _PlayAudioScreenState extends State<PlayAudioScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => playAudio(context, "exampleaudio.mp3"));
  }

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

  playAudio(BuildContext context, String audioFile) {
    //#TODO: Play Audio
  }

}