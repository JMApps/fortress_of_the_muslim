import 'package:flutter/cupertino.dart';

class AppPlayerState with ChangeNotifier {
  bool isPlaybackSpeed = false;

  bool get getIsPlaybackSpeed => isPlaybackSpeed;

  changePlaybackSpeedState(bool state) {
    isPlaybackSpeed = state;
    notifyListeners();
  }
}