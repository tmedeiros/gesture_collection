
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gesture_collection_app/screens/IndividualGestureScreen.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}

class LibraryScreen extends StatelessWidget {

  Todo todo;
  static const String routeName = "/library";

  // final List<String> items;
  // LibraryScreen({Key key, @required this.items}) : super(key: key);
  final items = List<String>.generate(10000, (i) => "Item $i");

  // void onTapped(Post post) {
  //   // navigate to the next screen.
  // }
  var retrievedTitle;

  // final todos = List<Todo>.generate(
  //   20,
  //       (i) =>
  //       Todo(
  //         'Gesture $i',
  //         'Gesture ======>>>> $i'
  //             '\nmovement or position of the hand, arm, body, head, or'
  //             ' face that is expressive of an idea, opinion, emotion, etc.: '
  //             'the gestures of an orator; a threatening gesture. the use of '
  //             'such movements to express thought, emotion, etc. '
  //             'movement or position of the hand, arm, body, head, or'
  //             ' face that is expressive of an idea, opinion, emotion, etc.: '
  //             'the gestures of an orator; a threatening gesture. the use of '
  //             'such movements to express thought, emotion, etc. ',
  //       ),
  // );

  // List<Post> posts = ["edasd","sdadasd","asdasdad"]; // your list of contents.

  @override
  Widget build(BuildContext context) {
    // FirebaseStorage storage = FirebaseStorage(
    //     app: FirebaseFirestore.instance.app,
    //     storageBucket: 'gs://gesturedata-76273.appspot.com');
    // print("Daaata");
    // // storage.
    // print(storage.ref());


    Todo todo;

    return Scaffold(
      appBar: TopNavBarWidget(
        height: 60,
        title: "Gesture Library",
        backlink: "/speech",
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
      floatingActionButton: FloatingActionButton(
        // onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('gestureLibrary').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        print(snapshot.data.docs);
        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    print(snapshot);
    return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: snapshot.map((data) => _buildListItem(context, data)).toList()
    );
    // print(snapshot);
  }
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    // final record = Record.fromSnapshot(data);
    print(data.id);

    return Padding(
      // key: ValueKey(record.location),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          // leading: Icon(Icons.home),
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  data.id,
                  // record.location,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

              ),
              // Image.network(record.url),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => IndividualGestureScreen(data.id)
                // settings: RouteSettings(
                //   arguments: data.id,
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
  // Future getImage() async {
  //   // Get image from gallery.
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   _uploadImageToFirebase(image);
  // }
  // Future<void> _uploadImageToFirebase(File image) async {
  //   try {
  //     // Make random image name.
  //     int randomNumber = Random().nextInt(100000);
  //     String imageLocation = 'images/image${randomNumber}.png';
  //
  //     // Upload image to firebase.
  //     final StorageReference storageReference = FirebaseStorage().ref().child(imageLocation);
  //     final StorageUploadTask uploadTask = storageReference.putFile(image);
  //     await uploadTask.onComplete;
  //     _addPathToDatabase(imageLocation);
  //   }catch(e){
  //     print(e.message);
  //   }
  // }
  //
  // Future<void> _addPathToDatabase(String text) async {
  //   try {
  //     // Get image URL from firebase
  //     final ref = FirebaseStorage().ref().child(text);
  //     var imageString = await ref.getDownloadURL();
  //
  //     // Add location and url to database
  //     await Firestore.instance.collection('storage').document("hello").setData({'url':imageString , 'location':text});
  //   }catch(e){
  //     print(e.message);
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text(e.message),
  //           );
  //         }
  //     );
  //   }
  // }
}
// class Record {
//   final String location;
//   final String url;
//   final DocumentReference reference;
//
//   Record.fromMap(Map<String, dynamic> map, {this.reference})
//       : assert(map['location'] != null),
//         assert(map['url'] != null),
//         location = map['location'],
//         url = map['url'];
//
//   Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);
//
//   @override
//   String toString() => "Record<$location:$url>";
// }