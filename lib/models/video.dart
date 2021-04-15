import 'package:blog_responsive_app/models/customer.dart';

class Video {
  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
  final String id;
  final CustomUser author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  @override
  String toString() {
    return 'Video($title • $duration min • $viewCount views)';
  }
}
