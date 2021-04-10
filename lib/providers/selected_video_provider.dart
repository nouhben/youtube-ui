import 'package:blog_responsive_app/models/customer.dart';
import 'package:blog_responsive_app/models/data.dart';
import 'package:flutter/foundation.dart';

import 'package:blog_responsive_app/models/video.dart';

class SelectedVideoProvider with ChangeNotifier {
  Video _selectedVideo = Video(
    id: '',
    author: currentUser,
    title: '',
    thumbnailUrl: '',
    duration: '',
    timestamp: DateTime.now(),
    viewCount: '',
    likes: '',
    dislikes: '',
  );

  void setSelectedVideo(Video video) {
    this._selectedVideo = video;
    notifyListeners();
  }

  Video get selectedVideo => this._selectedVideo;
}
