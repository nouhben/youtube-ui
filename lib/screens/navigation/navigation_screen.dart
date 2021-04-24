import 'package:blog_responsive_app/providers/min_player_controller_provider.dart';
import 'package:blog_responsive_app/providers/selected_video_provider.dart';
import 'package:blog_responsive_app/screens/home/home_screen.dart';
import 'package:blog_responsive_app/screens/video/video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

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
  static const double _miniPlayerHeight = 60.0;
  @override
  Widget build(BuildContext context) {
    print('re-build nav');
    final _selectedVideoProvider = Provider.of<SelectedVideoProvider>(
      context,
      listen: true,
    );
    final _miniPlayerControllerProvider =
        Provider.of<MiniPlayerControllerProvider>(
      context,
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._activeItem!.index,
        onTap: (index) {
          if (this._activeItem!.index != index)
            setState(
              () => this._activeItem =
                  NavigationMenuItems.values.elementAt(index),
            );
        },
        items: const [
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
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: this
            ._screens
            .asMap()
            .map(
              (index, screen) => MapEntry(
                index,
                Offstage(
                  offstage: index != this._activeItem!.index,
                  child: _screens[index],
                ),
              ),
            )
            .values
            .toList()
              ..add(
                Offstage(
                  offstage: _selectedVideoProvider.selectedVideo == null,
                  child: Consumer<MiniPlayerControllerProvider>(
                    builder: (context, _controller, child) {
                      print(_controller.controller.value.toString());
                      return Miniplayer(
                        controller: _controller.controller,
                        minHeight: _miniPlayerHeight,
                        maxHeight: MediaQuery.of(context).size.height,
                        builder: (height, percentage) {
                          final v = _selectedVideoProvider.selectedVideo;
                          if (v == null) {
                            return SizedBox.shrink();
                          }
                          if (height <= _miniPlayerHeight + 50.0)
                            return Container(
                              width: double.infinity,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        _selectedVideoProvider
                                            .getSelectedVideoData()
                                            .thumbnailUrl,
                                        height: 56.0,
                                        width: 120.0,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 2.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                _selectedVideoProvider
                                                    .getSelectedVideoData()
                                                    .title,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                softWrap: true,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              '${_selectedVideoProvider.getSelectedVideoData().author.name}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(CupertinoIcons.play_fill,
                                            size: 18.0),
                                        onPressed: () {
                                          print('Play video');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(CupertinoIcons.clear,
                                            size: 18.0),
                                        onPressed: () {
                                          print('Close the video');
                                          _selectedVideoProvider
                                              .setSelectedVideo(null);
                                        },
                                      ),
                                    ],
                                  ),
                                  const LinearProgressIndicator(
                                    value: 0.78,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.redAccent),
                                  ),
                                ],
                              ),
                            );
                          return VideoScreen();
                        },
                      );
                    },
                  ),
                ),
              ),
      ),
      // IndexedStack(
      //   index: this._activeItem!.index,
      //   children: this._screens
      //     ..add(
      //       Consumer<SelectedVideoProvider>(
      //         builder: (context, value, child) => Miniplayer(
      //           minHeight: 60.0,
      //           maxHeight: MediaQuery.of(context).size.height,
      //           builder: (height, percentage) {
      //             Video v = value.selectedVideo;
      //             if (v == null) {
      //               return SizedBox.shrink();
      //             }
      //             return Container(
      //               color: Colors.black,
      //               child: Center(
      //                 child: Text(value.selectedVideo.title),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      // ),
      // body: Consumer<Video>(
      //   builder: (context, value, child) => Stack(
      //     children: this
      //         ._screens
      //         .asMap()
      //         .map(
      //           (index, screen) => MapEntry(
      //             index,
      //             Offstage(
      //               child: screen,
      //               offstage: this._activeItem!.index == index,
      //             ),
      //           ),
      //         )
      //         .values
      //         .toList(),
      //   ),
      // ),
    );
  }
}
