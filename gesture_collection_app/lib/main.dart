import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gesture_collection_app/models/labels.dart';
import 'package:gesture_collection_app/screens/IndividualGestureScreen.dart';
import 'package:gesture_collection_app/screens/LibraryScreen.dart';
import 'package:gesture_collection_app/screens/LoadingScreen.dart';
import 'package:gesture_collection_app/screens/PlayAudioScreen.dart';
import 'package:gesture_collection_app/screens/SpeechCollectScreen.dart';
import 'package:gesture_collection_app/screens/SpeechScreen.dart';
import 'package:gesture_collection_app/screens/gesture_screen.dart';
import 'package:gesture_collection_app/screens/home_screen.dart';
import 'package:gesture_collection_app/screens/tab_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/record_gesture_screen.dart';
//import 'screens/recording.dart';
import 'dart:convert';
import 'dart:developer';

void main() async {
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // runApp(MyApp());
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    home: LoadingScreen(),
    routes: <String, WidgetBuilder>{
      TabScreen.routeName: (BuildContext context) => TabScreen(),
      HomeScreen.routeName: (BuildContext context) => HomeScreen(),
      GestureScreen.routeName: (BuildContext context) => GestureScreen(),
      RecordGestureScreen.routeName: (BuildContext context) => RecordGestureScreen(),
      LoadingScreen.routeName: (BuildContext context) => LoadingScreen(),
      SpeechScreen.routeName: (BuildContext context) => SpeechScreen(),
      SpeechCollectScreen.routeName: (BuildContext context) => SpeechCollectScreen(),
      LibraryScreen.routeName: (BuildContext context) => LibraryScreen(),
      IndividualGestureScreen.routeName: (BuildContext context) => IndividualGestureScreen(""),
      PlayAudioScreen.routeName: (BuildContext context) => PlayAudioScreen(),


    },
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.green[800],
      accentColor: Colors.cyan[600],

      // Define the default font family.
      fontFamily: 'Raleway',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Raleway'),
      ),
    ),
  ));
  // runApp(App());

}
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         // Check for errors
//         print(snapshot);
//         if (snapshot.hasError) {
//           return SomethingWentWrong();
//         }
//
//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MyAwesomeApp();
//         }
//
//         // Otherwise, show something whilst waiting for initialization to complete
//         return Loading();
//       },
//     );
//   }
// }
// class App extends StatelessWidget {
//   // Create the initialization Future outside of `build`:
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     // log('data: ');
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         print("\n\n================dasdasdasdasdkasjdajsdkasd");
//         print(snapshot);
//         // Check for errors
//         // if (snapshot.hasError) {
//         //   return SomethingWentWrong();
//         // }
//         //
//         // // Once complete, show your application
//         // if (snapshot.connectionState == ConnectionState.done) {
//         //   return MyAwesomeApp();
//         // }
//         //
//         // // Otherwise, show something whilst waiting for initialization to complete
//         // return Loading();
//       },
//     );
//   }
// }



