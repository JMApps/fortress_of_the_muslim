import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/data/play_spped_enum.dart';
import 'package:just_audio/just_audio.dart';

class AppPlayerState with ChangeNotifier {
  final _player = AudioPlayer();

  AudioPlayer get getAudioPlayer => _player;

  bool isPlaybackSpeed = false;

  bool get getIsPlaybackSpeed => isPlaybackSpeed;

  int currentPlayItem = -1;

  int get getCurrentPlayItem => currentPlayItem;

  bool playingState = false;

  bool get getPlayingState => playingState;

  bool repeatState = false;

  bool get getRepeatState => repeatState;

  playOneAudio(String nameAudio, int itemId) async {
    if (currentPlayItem != itemId) {
      await _player.setAsset('assets/audios/$nameAudio.mp3');
      currentPlayItem = itemId;
      _player.play();
      playingState = _player.playing;
      notifyListeners();
    } else {
      if (_player.playing) {
        currentPlayItem = -1;
        _player.stop();
        playingState = _player.playing;
        notifyListeners();
      }
    }
    _player.playerStateStream.listen(
      (state) {
        if (state.processingState == ProcessingState.completed) {
          currentPlayItem = -1;
          playingState = false;
          notifyListeners();
        }
      },
    );
  }

  changePlaybackSpeedState(int itemId) {
    if (currentPlayItem == itemId) {
      isPlaybackSpeed = !isPlaybackSpeed;
      if (isPlaybackSpeed) {
        _player.setSpeed(0.5);
      } else {
        _player.setSpeed(1);
      }
    }
    notifyListeners();
  }

  nextEnum(PlaySpeed value) {
    final nextIndex = (value.index + 1) % PlaySpeed.values.length;
    return PlaySpeed.values[nextIndex];
  }

  changeRepeatState(bool state, int itemId) {
    if (currentPlayItem == itemId) {
      repeatState = state;
      if (repeatState) {
        _player.setLoopMode(LoopMode.one);
      } else {
        _player.setLoopMode(LoopMode.off);
      }
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
