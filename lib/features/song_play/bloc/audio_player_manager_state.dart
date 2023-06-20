part of 'audio_player_manager_bloc.dart';

class AudioPlayerManagerBlocState {
  final AudioPlayerStateModel audioPlayerStateModel;

  factory AudioPlayerManagerBlocState.initial() => AudioPlayerManagerBlocState(
          audioPlayerStateModel: AudioPlayerStateModel(
        currentTrackDetailState:
            CurrentTrackDetailState("Loading..", "Loading.."),
        currentProgressBarState: CurrentProgressBarState(0, 30),
        currentPlayerPlayPauseBtnState:
            CurrentPlayerPlayPauseBtnState(false, false, true),
        audioPlayerOtherBtnState:
            AudioPlayerOtherBtnState(false, false, false, false),
      ));

  AudioPlayerManagerBlocState({required this.audioPlayerStateModel});

  AudioPlayerManagerBlocState copyWith({
    CurrentTrackDetailState? currentTrackDetailState,
    CurrentProgressBarState? currentProgressBarState,
    CurrentPlayerPlayPauseBtnState? currentPlayerPlayPauseBtnState,
    AudioPlayerOtherBtnState? audioPlayerOtherBtnState,
  }) =>
      AudioPlayerManagerBlocState(
        audioPlayerStateModel: AudioPlayerStateModel(
            currentTrackDetailState: currentTrackDetailState ??
                this.audioPlayerStateModel.currentTrackDetailState,
            currentProgressBarState: currentProgressBarState ??
                this.audioPlayerStateModel.currentProgressBarState,
            currentPlayerPlayPauseBtnState: currentPlayerPlayPauseBtnState ??
                this.audioPlayerStateModel.currentPlayerPlayPauseBtnState,
            audioPlayerOtherBtnState: audioPlayerOtherBtnState ??
                this.audioPlayerStateModel.audioPlayerOtherBtnState),
      );
}

class AudioPlayerStateModel {
  CurrentTrackDetailState? currentTrackDetailState;
  CurrentProgressBarState? currentProgressBarState;
  CurrentPlayerPlayPauseBtnState? currentPlayerPlayPauseBtnState;
  AudioPlayerOtherBtnState? audioPlayerOtherBtnState;

  AudioPlayerStateModel({
    this.currentTrackDetailState,
    this.currentProgressBarState,
    this.currentPlayerPlayPauseBtnState,
    this.audioPlayerOtherBtnState,
  });
}

class CurrentTrackDetailState {
  String artistName;
  String trackTitle;

  CurrentTrackDetailState(this.artistName, this.trackTitle);
}

class CurrentProgressBarState {
  int currentProgress;
  int totalProgress;

  CurrentProgressBarState(this.currentProgress, this.totalProgress);
}

class CurrentPlayerPlayPauseBtnState {
  bool isPlaying;
  bool isPaused;
  bool isLoading;

  CurrentPlayerPlayPauseBtnState(this.isPlaying, this.isPaused, this.isLoading);
}

class AudioPlayerOtherBtnState {
  bool isNextTrackAvailable;
  bool isPrevTrackAvailable;
  bool isRepeatModeEnabled;
  bool isShuffleModeEnabled;

  AudioPlayerOtherBtnState(this.isNextTrackAvailable, this.isPrevTrackAvailable,
      this.isRepeatModeEnabled, this.isShuffleModeEnabled);
}
