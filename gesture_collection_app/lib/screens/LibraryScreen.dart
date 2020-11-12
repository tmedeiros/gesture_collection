import 'package:flutter/material.dart';
import 'package:gesture_collection_app/screens/IndividualGestureScreen.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_test/home.dart';
// void main() {
//   runApp(LibraryScreen(
//     items: List<String>.generate(10000, (i) => "Item $i"),
//   ));
// }
class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);

}

//Firebase initialization setup
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LibraryScreen());
}
class LibraryScreen extends StatelessWidget {
  final fb = FirebaseDatabase.instance;

  Todo todo;
  static const String routeName = "/library";
  // final List<String> items;
  // LibraryScreen({Key key, @required this.items}) : super(key: key);
  final items = List<String>.generate(10000, (i) => "Item $i");
  // void onTapped(Post post) {
  //   // navigate to the next screen.
  // }
  var retrievedTitle;

  final todos = List<Todo>.generate(
    20,
        (i) => Todo(
      'Gesture $i',
      'Gesture ======>>>> $i'
          '\nmovement or position of the hand, arm, body, head, or'
          ' face that is expressive of an idea, opinion, emotion, etc.: '
          'the gestures of an orator; a threatening gesture. the use of '
          'such movements to express thought, emotion, etc. '
          'movement or position of the hand, arm, body, head, or'
          ' face that is expressive of an idea, opinion, emotion, etc.: '
          'the gestures of an orator; a threatening gesture. the use of '
          'such movements to express thought, emotion, etc. ',
    ),
  );
  // List<Post> posts = ["edasd","sdadasd","asdasdad"]; // your list of contents.

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    Todo todo;
    ref.child("gesturedata-76273").once().then((DataSnapshot data){
      print(data.value);
      print(data.key);
      // setState(() {
        retrievedTitle = data.value;
        log(data.value);
        // todos.add(data.value);
      // });
    });
    return Scaffold(
      appBar: TopNavBarWidget(
        height: 60,
        title: "Gesture Library",
        backlink: "/speech",
        navEnabled: true,
      ),
        body: ListView.separated(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text(todos[index].title),
              trailing: Icon(Icons.keyboard_arrow_right),

              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IndividualGestureScreen(),
                      settings: RouteSettings(
                        arguments: todos[index],
                      ),
                    ),
                  );
                },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),


      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text('${items[index]}'),
      //     );
      //   },
      // ),
      // body: Container(
      //
      //     child: Center(
      //         child: ElevatedButton(
      //             child: Text('Open route'),
      //             onPressed: () {
      //
      //             // Navigator.pushNamed(context,"/individualgesture/1");
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => IndividualGestureScreen()),
      //             );
      //           }),
      //       //TODO: Implement list of gestures using labels.dart
      //       //TODO: Create individual gesture widget
      //     )),
    );
  }
}