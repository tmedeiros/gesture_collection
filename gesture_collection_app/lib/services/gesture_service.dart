import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gesture_collection_app/models/gesture.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../main copy.dart';

class GestureService extends Service {
  static const url = 'https://gesturedata-76273.firebaseio.com/gestures.json';

  List<Gesture> _gestures = [];

  Future<void> addGesture(Gesture gesture) async {
    try {
      final response = await http.post(url,
          body: json.encode({
            'userId': gesture.userId,
            'label': gesture.label,
            'xData': gesture.xData,
            'yData': gesture.yData,
            'zData': gesture.zData,
            'dateAdded': gesture.dateAdded
          }));
    } catch (e) {
      // TODO
    }
  }

  Future<void> getGestures() async {
    try {
      final response = await http.get(url);
      print("=================================================\n\n");
      print(response);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Gesture> loadedGestures = [];
      extractedData.forEach((userId, gestureData) {
        print(gestureData);
        loadedGestures.add(Gesture(
          userId,
          gestureData['label'],
          gestureData['xData'],
          gestureData['yData'],
          gestureData['zData'],
          gestureData['dateAdded'],
        ));
      });
      return loadedGestures;
    } catch (error) {
      throw (error);
    }

    //id, label, xData, yData, zData, dateAdded
  }

  Future<Gesture> detectGesture(List gestures) async {
    //TODO: Send accelerometer data to model

    return null;
  }

/*Future<void> addProduct(Gesture gesture) async {
    try {
      final response = await http.post(url,
          body: json.encode({
            'userId': gesture.userId,
            'label': gesture.label,
            'xData': gesture.xData,
            'yData': gesture.yData,
            'zData': gesture.zData,
            'dateAdded': gesture.dateAdded
          }));
    } catch (e) {
      // TODO
    }
  }*/

/*Future<void> updateGesture(String id, Gesture gesture) async {
    final gestureIndex = _gestures.indexWhere((element) => element.id == id);
    final url = 'https://gesture-collection.firebaseio.com/gestures/$id.json';
    try {
      if (gestureIndex >= 0) {
        await http.patch(url,
            body: json.encode({
              'userId': gesture.userId,
              'label': gesture.label,
              'xData': gesture.xData,
              'yData': gesture.yData,
              'zData': gesture.zData,
              'dateAdded': gesture.dateAdded
            }));
      }
    } catch (e) {
      // TODO
    }
  }*/

/*void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }*/

/*Future<void> deleteGesture(String id) async {
    final gestureIndex = _gestures.indexWhere((element) => element.id == id);
    final url = 'https://gesture-collection.firebaseio.com/gestures/$id.json';
    var existingGesture = _gestures[gestureIndex];
    _gestures.removeAt(gestureIndex);
    try {
      http.delete(url).then((value) => existingGesture = null);
    } catch (e) {
      _gestures.insert(gestureIndex, existingGesture);
    }
    //notifyListeners();
  }*/


// final FirebaseStorage storage = FirebaseStorage(
//     app: FirebaseFirestore.instance.app,
//     storageBucket: 'gs://my-project.appspot.com');
//
// Uint8List imageBytes;
// String errorMsg;
//
// MyHomePageState() {
//   storage.ref().child('selfies/me2.jpg').getData(10000000).then((data) =>
//       setState(() {
//         imageBytes = data;
//       })
//   ).catchError((e) =>
//       setState(() {
//         errorMsg = e.error;
//       })
//   );
// }
//
// @override
// Widget build(BuildContext context) {
//   var img = imageBytes != null ? Image.memory(
//     imageBytes,
//     fit: BoxFit.cover,
//   ) : Text(errorMsg != null ? errorMsg : "Loading...");
//
//   return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new ListView(
//         children: <Widget>[
//           img,
//         ],
//       ));
// }
}

