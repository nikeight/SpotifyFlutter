part of 'audio_player_manager_cubit.dart';

class AudioPlayerManagerState {
  String? currentSongTitle = "";
  List<String>? playList = [];
  ProgressBarState? progressBarState;
  PlayButtonState? playButtonState;
  bool? isFirstSongNotifier = false;
  bool? isLastSongNotifier = false;
  bool? isShuffleModeEnabled = false;

  AudioPlayerManagerState(
      {this.currentSongTitle,
      this.playList,
      this.progressBarState,
      this.playButtonState,
      this.isFirstSongNotifier,
      this.isLastSongNotifier,
      this.isShuffleModeEnabled});
}

class ProgressBarState {
  int? currentPosition = 0;
  int? bufferedPosition = 0;
  int? totalFetchedPosition = 0;

  ProgressBarState(
      this.currentPosition, this.bufferedPosition, this.totalFetchedPosition);
}

class PlayButtonState {
  bool? isPlaying = false;
  bool? isPaused = false;
  bool? isLoading = false;

  PlayButtonState(this.isPlaying, this.isPaused, this.isLoading);
}

enum RepeatState { OFF, REPEAT_SONG, REPEAT_PLAYLIST }
