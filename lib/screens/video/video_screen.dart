import 'package:blog_responsive_app/models/data.dart';
import 'package:blog_responsive_app/models/video.dart';
import 'package:blog_responsive_app/providers/min_player_controller_provider.dart';
import 'package:blog_responsive_app/providers/selected_video_provider.dart';
import 'package:blog_responsive_app/screens/home/video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Consumer<SelectedVideoProvider>(
              builder: (_, selectedVideoProvider, __) {
                final Video selectedVideo =
                    selectedVideoProvider.getSelectedVideoData();
                return SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          VideoCard(video: selectedVideo),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.chevron_down,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                final controller =
                                    Provider.of<MiniPlayerControllerProvider>(
                                  context,
                                  listen: false,
                                );
                                print('Should Dismiss the player');
                                controller.animateToMin();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
