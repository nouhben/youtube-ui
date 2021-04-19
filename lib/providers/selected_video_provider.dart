import 'package:blog_responsive_app/models/customer.dart';
import 'package:blog_responsive_app/models/data.dart';
import 'package:flutter/foundation.dart';

import 'package:blog_responsive_app/models/video.dart';

class SelectedVideoProvider with ChangeNotifier {
  dynamic _selectedVideo = null;
  // Video(
  //   id: '',
  //   author: currentUser,
  //   title: '',
  //   thumbnailUrl: '',
  //   duration: '',
  //   timestamp: DateTime.now(),
  //   viewCount: '',
  //   likes: '',
  //   dislikes: '',
  // );

  void setSelectedVideo(dynamic video) {
    this._selectedVideo = video;
    notifyListeners();
  }

  dynamic get selectedVideo => this._selectedVideo;
  bool get isFake => this._selectedVideo.id.isEmpty;
  @override
  String toString() {
    Video v = this.selectedVideo;
    return v.toString();
  }

  Video getSelectedVideoData() {
    final Video v = this.selectedVideo;
    return v;
  }
}
