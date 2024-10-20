import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/styles/app_styles.dart';

class AppPlayerState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keyMainSettingsBox);
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  late int _playSpeedIndex;

  int get getPlaySpeedIndex => _playSpeedIndex;

  set setPlaySpeedIndex(int index) {
    _playSpeedIndex = index;
    _mainSettingsBox.put(AppConstraints.keyPlaySpeedIndex, index);
    _audioPlayer.setSpeed(AppStyles.playSpeeds[index]);
    notifyListeners();
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  bool _isRepeating = false;
  bool get isRepeating => _isRepeating;

  int _currentTrackId = -1;
  int get currentTrackId => _currentTrackId;

  AppPlayerState() {
    _playSpeedIndex = _mainSettingsBox.get(AppConstraints.keyPlaySpeedIndex, defaultValue: 0);
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _resetPlayerState();
      }
    });
    _audioPlayer.setSpeed(AppStyles.playSpeeds[_playSpeedIndex]);
  }

  Future<void> playTrack({required String audioName, required int trackId}) async {
    if (_currentTrackId != trackId) {
      await _audioPlayer.setAsset('assets/audios/$audioName.mp3');
      _currentTrackId = trackId;
      _audioPlayer.play();
      _isPlaying = _audioPlayer.playing;
      notifyListeners();
    } else {
      if (_audioPlayer.playing) {
        stopTrack();
      }
    }
  }

  void stopTrack() {
    if (!hasListeners) return;
    _audioPlayer.stop();
    _resetPlayerState();
  }

  void _resetPlayerState() {
    if (!hasListeners) return;
    _currentTrackId = -1;
    _isPlaying = false;
    notifyListeners();
  }

  void toggleRepeatMode(int trackId) {
    if (_currentTrackId == trackId) {
      _isRepeating = !_isRepeating;
      _audioPlayer.setLoopMode(_isRepeating ? LoopMode.one : LoopMode.off);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
