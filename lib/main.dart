import 'package:blog_responsive_app/models/customer.dart';
import 'package:blog_responsive_app/screens/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(
        providers: [
          Provider<CustomUser>(
            create: (_) => CustomUser(
              name: 'Code Warrior',
              profileImageUrl:
                  'https://yt3.ggpht.com/yti/ANoDKi5FPLl_jZl-PHEg5XTsaGg2h_JCSaXRjRGErf36AQ=s88-c-k-c0x00ffffff-no-rj-mo',
              email: 'leoandrese.5@gmail.com',
              subscribers: '500k',
            ),
          ),
        ],
        child: NavigationScreen(),
      ),
    );
  }
}
