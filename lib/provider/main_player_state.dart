import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPlayerState with ChangeNotifier {
  final _itemScrollController = ItemScrollController();

  ItemScrollController get getItemScrollController => _itemScrollController;

  int _currentTrackIndex = -1;

  int get getCurrentIndex => _currentTrackIndex;

  bool _loopTrackState = false;

  bool get getLoopTrackState => _loopTrackState;

  bool _playing = false;

  bool get getPlayingState => _playing;

  playOnlyTrack(AssetsAudioPlayer player) {
    player.playlistPlayAtIndex(_currentTrackIndex);
    notifyListeners();
  }

  setCurrentIndex(int index) {
    _currentTrackIndex = index;
    notifyListeners();
  }

  updateLoopTrackState() {
    _loopTrackState = !_loopTrackState;
    notifyListeners();
  }

  toIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInSine);
    _currentTrackIndex = index;
    notifyListeners();
  }
}
