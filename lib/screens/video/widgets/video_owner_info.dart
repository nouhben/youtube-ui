import 'package:blog_responsive_app/models/customer.dart';
import 'package:flutter/material.dart';

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
