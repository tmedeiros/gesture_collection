import 'package:flutter/material.dart';
import 'package:gesture_collection_app/widgets/top_nav_bar.dart';

import 'LibraryScreen.dart';

class IndividualGestureScreen extends StatelessWidget {
  static const String routeName = "/individualgesture/{}";

  @override
  Widget build(BuildContext context) {
    Todo todo = ModalRoute.of(context).settings.arguments;
    // Text title=Text(todo.title);
    // Text description1=todo.description;

    return Scaffold(
      appBar: TopNavBarWidget(
        height: 60,
        title: todo.title,
        backlink: "/library",
        navEnabled: true,

      ),
      body:
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image.asset('assets/images/gestures.jpeg'),
              ),
              Divider(),
              Text(
                todo.description,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

        // ListTile(
              //   title: Text('(408) 555-1212',
              //       style: TextStyle(fontWeight: FontWeight.w500)),
              //   leading: Icon(
              //     Icons.contact_phone,
              //     color: Colors.blue[500],
              //   ),
              // ),
            ],
          ),
        ),
      )
      //   Center(
    //     child:Stack(
    //         alignment: Alignment.topCenter,
    //         children: <Widget>[
    //         Container(
    //         height: 300.0,
    //         decoration: BoxDecoration(
    //         image: DecorationImage(
    //         fit: BoxFit.cover,
    //         alignment: FractionalOffset.center,
    //         image: AssetImage('assets/images/gestures.jpeg'),
    //   )),
    // ),
    //   Container(
    //   margin: EdgeInsets.only(top: 100),
    //   width: MediaQuery.of(context).size.width * 0.92,
    //   child: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Text("jitmmnmnmesh",
    //   style: TextStyle(fontSize: 19),
    //   maxLines: 1,
    //   textAlign: TextAlign.center)),
    //   decoration: BoxDecoration(
    //   color: Colors.white,
    //   boxShadow: [
    //   BoxShadow(
    //   color: Colors.grey.withOpacity(0.8),
    //   spreadRadius: 1,
    //   blurRadius: 3,
    //   offset: Offset(1, 1),
    //   ),
    //   ],
    //   ),
    //   )
    //   ],
    //   ),
    //     )
        // Container(
        //     child: Center(
        //       child: Text(todo.title),
        //       image: Image.network('https://picsum.photos/250?image=9'),
        //     )),
      );
  }
}