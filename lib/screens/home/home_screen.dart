import 'package:blog_responsive_app/models/data.dart';
import 'package:blog_responsive_app/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'video_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 40.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final _video = videos[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: VideoCard(video: _video, hasPadding: false),
                );
              },
              childCount: videos.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ..add(
//             SliverToBoxAdapter(
//               child: Consumer<SelectedVideoProvider>(
//                 builder: (context, value, child) {
//                   if (!value.isFake)
//                     return Miniplayer(
//                       minHeight: 40.0,
//                       maxHeight: 60.0,
//                       builder: (height, width) => Container(
//                         color: Colors.redAccent,
//                       ),
//                     );
//                   return Text('Empty video');
//                 },
//               ),
//             ),
//           ),
