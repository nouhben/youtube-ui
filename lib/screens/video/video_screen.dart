import 'package:blog_responsive_app/models/customer.dart';
import 'package:blog_responsive_app/screens/home/video_information_headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:blog_responsive_app/models/video.dart';
import 'package:blog_responsive_app/providers/min_player_controller_provider.dart';
import 'package:blog_responsive_app/providers/selected_video_provider.dart';

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
                          //VideoCard(
                          //   video: selectedVideo,
                          //   showProgressIndicator: true,
                          // ),
                          //  if (this.showProgressIndicator != null)
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

class ReactionsRow extends StatelessWidget {
  final Video video;
  const ReactionsRow({Key? key, required this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ReactionButton(
          onPress: () {
            print('Hello');
          },
          label: video.likes,
          icon: Icons.thumb_up_outlined,
        ),
        ReactionButton(
          onPress: () {},
          label: video.dislikes,
          icon: Icons.thumb_down_outlined,
        ),
        ReactionButton(
            onPress: () {}, label: 'Share', icon: CupertinoIcons.reply),
        ReactionButton(
            onPress: () {}, label: 'Download', icon: Icons.download_outlined),
        ReactionButton(
            onPress: () {}, label: 'Save', icon: Icons.library_add_outlined),
      ],
    );
  }
}

class ReactionButton extends StatelessWidget {
  const ReactionButton({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPress,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        textStyle: MaterialStateProperty.all(
          TextStyle(color: Colors.white),
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.deepPurpleAccent.withOpacity(0.11),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Column(
        children: [
          Icon(this.icon),
          const SizedBox(height: 5.0),
          Text(this.label),
        ],
      ),
    );
  }
}

class VideoOwnerInfo extends StatelessWidget {
  final CustomUser author;

  const VideoOwnerInfo({Key? key, required this.author}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25.0,
            foregroundImage: NetworkImage(author.profileImageUrl),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    author.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 3),
                Flexible(
                  child: Text(
                    '${author.subscribers} subscribers',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'SUBSCRIBE',
              style: TextStyle(color: Colors.red, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
