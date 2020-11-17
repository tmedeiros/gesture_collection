import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

import 'LibraryScreen.dart';

class IndividualGestureScreen extends StatelessWidget {

  static const String routeName = "/individualgesture/{}";
  final String gestureName;
  const IndividualGestureScreen(this.gestureName);

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> userDocumentt;
    // CollectionReference doc_ref=FirebaseFirestore.instance.collection("gestureLibrary");
    // Stream<DocumentSnapshot> userP = doc_ref.doc(gestureName).snapshots();
    // userP.listen((DocumentSnapshot snap) {
    //   // print(snap);
    //   userDocumentt = Map.from(snap.data());
    //   // print("description "+userDocumentt["description"]);
    // });
    // print(userDocumentt["description"]);
    // print(userDocumentt["location"]);
    // print(userDocumentt["url"]);
    // print("asdasdasd");
    // print(userDocumentt);

    // if userDoc
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
          ],
        ),
      ),
    );
  }
//To retrieve the string
}