import 'package:blog_responsive_app/models/video.dart';
import 'package:blog_responsive_app/providers/min_player_controller_provider.dart';
import 'package:blog_responsive_app/providers/selected_video_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'video_duration.dart';
import 'video_information_headings.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.video,
    this.width,
    this.height,
    this.showProgressIndicator,
    this.hasPadding = false,
    this.onTap,
  }) : super(key: key);
  final Video video;
  final double? width, height;
  final bool? showProgressIndicator;
  final bool hasPadding;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final selectedVideoProvider =
        Provider.of<SelectedVideoProvider>(context, listen: false);
    final _miniPlayerControllerProvider =
        Provider.of<MiniPlayerControllerProvider>(
      context,
    );
    print('re-build video card');
    return Padding(
      padding: this.hasPadding
          ? EdgeInsets.symmetric(horizontal: 10.0)
          : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              print('play the video from thumbnail');
              selectedVideoProvider.setSelectedVideo(this.video);
              print(
                  'selected video: ${selectedVideoProvider.selectedVideo.toString()}');
              _miniPlayerControllerProvider.animateToHeight();
              if (this.onTap != null) {
                this.onTap!();
              }
            },
            child: Container(
              width: this.width ?? double.infinity,
              height: this.height ?? 230.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(video.thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: VideoDuration(duration: video.duration),
                  ),
                ],
              ),
            ),
          ),
          if (this.showProgressIndicator != null)
            const LinearProgressIndicator(
              value: 0.78,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
            )
          else
            const SizedBox.shrink(),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onLongPress: () => print('must show menu from long press!'),
              onTap: () {
                print('must show the video: ');
                selectedVideoProvider.setSelectedVideo(this.video);
                print(
                    'selected video: ${selectedVideoProvider.selectedVideo.toString()}');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40.0,
                    icon: CircleAvatar(
                      foregroundImage:
                          NetworkImage(video.author.profileImageUrl),
                    ),
                    onPressed: () => print('profile'),
                  ),
                  const SizedBox(width: 20.0),
                  VideoInformationHeadings(video: this.video),
                  const SizedBox(width: 20.0),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.ellipsis_vertical,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      print('must show menu');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
