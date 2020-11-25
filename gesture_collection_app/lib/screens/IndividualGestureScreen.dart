import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';
import 'package:audioplayers/audioplayers.dart';

import 'LibraryScreen.dart';
// AudioPlayer audioPlayer;
AudioPlayer audioPlayer;
AssetsAudioPlayer assetsAudioPlayer;

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
                // playAudio(data.data()["audo"]);
                playAudioFromLocalStorage(data.data()["audio"]);
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
            //     // playAudio(data.data()["audo"]);
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
  playAudioFromLocalStorage(path) async {
    audioPlayer = AudioPlayer();
    audioPlayer.setVolume(1);
    // path="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    int response = await audioPlayer.play(path);
    if (response == 1) {
      // success
      print("success");
    } else {
      print('Some error occured in playing from storage!');
    }
    print(audioPlayer.getCurrentPosition());
  }
  stopAudio() async {
    // int response = await audioPlayer.stop();
    // if (response == 1) {
    //   // success
    //
    // } else {
    //   print('Some error occured in stopping');
    // }
  }
//To retrieve the string
}