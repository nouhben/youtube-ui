import 'package:blog_responsive_app/models/customer.dart';
import 'package:blog_responsive_app/models/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'reaction_button.dart';

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
