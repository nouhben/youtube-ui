import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';

class MiniPlayerControllerProvider with ChangeNotifier {
  MiniplayerController _controller = MiniplayerController();

  void animateToHeight() {
    _controller.animateToHeight(state: PanelState.MAX);
    notifyListeners();
  }

  void animateToMin() {
    _controller.animateToHeight(state: PanelState.MIN);
    notifyListeners();
  }

  MiniplayerController get controller => _controller;
}
