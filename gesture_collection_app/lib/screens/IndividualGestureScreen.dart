import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gesture_collection_app/services/GestureAudioLinkService.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';
import 'package:audioplayers/audioplayers.dart';

import 'LibraryScreen.dart';
// AudioPlayer audioPlayer;
AudioPlayer audioPlayer;
// AssetsAudioPlayer assetsAudioPlayer;
FlutterTts flutterTts = FlutterTts();

class IndividualGestureScreen extends StatelessWidget {

  static const String routeName = "/individualgesture/{}";
  final String gestureName;
  const IndividualGestureScreen(this.gestureName);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TopNavBarWidget(
        height: 60,
        // title: todo.title,
        title: gestureName,
        backlink: "/library",
        navEnabled: true,


      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(
              child: _buildBody(context),
            ),
          ],
        ),
      ),
      );

  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('gestureLibrary').doc(gestureName).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        print(snapshot);
        return _buildListItem(context, snapshot.data);
      },
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {

    // final record = Record.fromSnapshot(data);
    print(data.id);
    print(data.data()["location"]);
    print(data.data()["audo"]);
    // dataJson=data.data();

    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),

      child: Card(

        child: Column(

          children: [
            Expanded(
              child: Image.network(data.data()['url'],
              fit: BoxFit.fill),
            ),
            Divider(),
            Text(
              data.data()["description"],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Divider(),

            FlatButton.icon(
              textColor: Colors.white,
              minWidth: double.infinity,
              onPressed: () {
                /*...*/
                print("Play Gesture");
                // playAudio(data.data()["audio"]);
                // _speak(gestureName);
                GestureAudioLinkService.speak_from_text(gestureName);
              },

              label: Text(
                "Listen Gesture",
              ),
              icon: Icon(Icons.play_circle_outline, size: 23),
            ),
            // FlatButton(
            //   onPressed: () {
            //     /*...*/
            //     print("Stop");
            //     stopAudio();
            //   },
            //   child: Text(
            //     "Stop",
            //   ),
            // )

          ],
        ),

      ),

    );


  }
  // playAudio(path) async {
  //   audioPlayer = AudioPlayer();
  //   audioPlayer.setVolume(1);
  //   // path="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  //
  //   int response = await audioPlayer.play(path);
  //   if (response == 1) {
  //     // success
  //     print("success");
  //   } else {
  //     print('Some error occured in playing from storage!');
  //   }
  //   print(audioPlayer.getCurrentPosition());
  //
  // }
  // Future _speak(text) async{
  //   List<dynamic> languages = await flutterTts.getLanguages;
  //   print(languages);
  //   await flutterTts.setLanguage("en-US");
  //   // await flutterTts.setLanguage("gu-IN");
  //   await flutterTts.setSpeechRate(0.8);
  //   await flutterTts.setVolume(1.0);
  //   // await flutterTts.setPitch(0.1);
  //   var result = await flutterTts.speak(text);
  //   print(result);
  // }
  // stopAudio() async {
  //   // int response = await audioPlayer.stop();
  //   // if (response == 1) {
  //   //   // success
  //   //
  //   // } else {
  //   //   print('Some error occured in stopping');
  //   // }
  // }
//To retrieve the string
}
