import 'package:blog_responsive_app/constants.dart';
import 'package:blog_responsive_app/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        ),
      ),
      home: NavigationScreen(),
    );
  }
}
