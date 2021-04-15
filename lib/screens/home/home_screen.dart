import 'package:blog_responsive_app/models/data.dart';
import 'package:blog_responsive_app/models/video.dart';
import 'package:blog_responsive_app/providers/selected_video_provider.dart';
import 'package:blog_responsive_app/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

import 'video_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedVideoProvider>(
      create: (_) => SelectedVideoProvider(),
      child: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final _video = videos[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: VideoCard(video: _video),
                );
              },
              childCount: videos.length,
            ),
          ),
        ]..add(
            SliverToBoxAdapter(
              child: Consumer<SelectedVideoProvider>(
                builder: (context, value, child) {
                  if (!value.isFake)
                    return Miniplayer(
                      minHeight: 40.0,
                      maxHeight: 60.0,
                      builder: (height, width) => Container(
                        color: Colors.redAccent,
                      ),
                    );
                  return Text('Empty video');
                },
              ),
            ),
          ),
      ),
    );
  }
}
