import 'package:blog_responsive_app/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum NavigationMenuItems { HOME, EXPLORE, ADD, SUBSCRIPTIONS, LIBRARY }

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  NavigationMenuItems? _activeItem;

  @override
  void initState() {
    super.initState();
    this._activeItem = NavigationMenuItems.HOME;
  }

  final _screens = [
    HomeScreen(),
    const Center(child: Text('Explore Screen')),
    const Center(child: Text('Add Screen')),
    const Center(child: Text('Subscriptions Screen')),
    const Center(child: Text('Library Screen')),
  ];
  @override
  Widget build(BuildContext context) {
    print('re-build nav');
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._activeItem!.index,
        onTap: (index) {
          if (this._activeItem!.index != index)
            setState(() =>
                this._activeItem = NavigationMenuItems.values.elementAt(index));
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: 'Add',
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
          ),
          BottomNavigationBarItem(
            label: 'Subscriptions',
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: 'Library',
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
          ),
        ],
      ),
      body: IndexedStack(
        index: this._activeItem!.index,
        children: this._screens,
      ),
    );
  }
}
