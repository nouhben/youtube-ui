import 'package:blog_responsive_app/models/customer.dart';
import 'package:blog_responsive_app/models/data.dart';
import 'package:flutter/foundation.dart';

import 'package:blog_responsive_app/models/video.dart';

class SelectedVideoProvider with ChangeNotifier {
  dynamic _selectedVideo;

  void setSelectedVideo(dynamic video) {
    this._selectedVideo = video;
    notifyListeners();
  }

  set setVideo(dynamic video) {
    _selectedVideo = video;
    notifyListeners();
  }

  dynamic get selectedVideo => this._selectedVideo;
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
