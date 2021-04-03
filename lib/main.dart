import 'package:blog_responsive_app/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: kBodyColor,
        body: Center(child: Text('Hello')),
      ),
    );
  }
}
