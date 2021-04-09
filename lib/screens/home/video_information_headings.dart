import 'package:blog_responsive_app/models/video.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInformationHeadings extends StatelessWidget {
  const VideoInformationHeadings({
    Key? key,
    required this.video,
  }) : super(key: key);
  final Video video;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              video.title,
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
              '${video.author.name} • ${video.viewCount} views • ${timeago.format(video.timestamp)}',
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
    );
  }
}
