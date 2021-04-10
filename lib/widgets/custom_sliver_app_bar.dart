import 'package:blog_responsive_app/models/customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CustomUser>(context, listen: false);
    return SliverAppBar(
      floating: true,
      forceElevated: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/icons/yt_logo_dark.png'),
      ),
      leadingWidth: 100.0,
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () => print('cast'),
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.bell),
          onPressed: () => print('notifications'),
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () => print('search'),
        ),
        IconButton(
          iconSize: 40.0,
          icon: CircleAvatar(
            foregroundImage: NetworkImage(currentUser.profileImageUrl),
          ),
          onPressed: () => print('profile'),
        ),
      ],
    );
  }
}
