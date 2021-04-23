import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:blog_responsive_app/models/video.dart';
import 'package:blog_responsive_app/providers/min_player_controller_provider.dart';
import 'package:blog_responsive_app/providers/selected_video_provider.dart';

import 'widgets/reactions.dart';
import 'widgets/video_owner_info.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
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
                          Image.network(
                            selectedVideo.thumbnailUrl,
                            height: 220.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
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
                      const LinearProgressIndicator(
                        value: 0.78,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedVideo.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${selectedVideo.viewCount} views • ${timeago.format(selectedVideo.timestamp)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.left,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Divider(),
                            ReactionsRow(video: selectedVideo),
                            const Divider(),
                            VideoOwnerInfo(author: selectedVideo.author),
                          ],
                        ),
                      )
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
