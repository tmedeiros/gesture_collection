import 'package:flutter/material.dart';

class RecordGestureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gesture Recording')),
      body: Center(
        child: Text(
          'Recording in progress..',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
