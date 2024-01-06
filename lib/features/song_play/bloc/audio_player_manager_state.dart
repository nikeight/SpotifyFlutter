import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_player_manager_state.freezed.dart';

@freezed
class AudioPlayerManagerBlocState with _$AudioPlayerManagerBlocState {
  factory AudioPlayerManagerBlocState(
      {required AudioPlayerStateModel audioPlayerStateModel}) =
  _AudioPlayerManagerBlocState;
}

@freezed
class AudioPlayerStateModel with _$AudioPlayerStateModel {
  factory AudioPlayerStateModel(
      {required CurrentTrackDetailState? currentTrackDetailState,
        required CurrentProgressBarState? currentProgressBarState,
        required CurrentPlayerPlayPauseBtnState? currentPlayerPlayPauseBtnState,
        required AudioPlayerOtherBtnState?
        audioPlayerOtherBtnState}) = _AudioPlayerStateModel;
}

@freezed
class CurrentTrackDetailState with _$CurrentTrackDetailState {

  factory CurrentTrackDetailState({
    @Default('') String artistName,
    @Default('') String trackTitle,
  }) = _CurrentTrackDetailState;

}

@freezed
class CurrentProgressBarState with _$CurrentProgressBarState {

  factory CurrentProgressBarState({
    @Default(0) int currentProgress,
    @Default(30) int totalProgress
  }) = _CurrentProgressBarState;

}

@freezed
class CurrentPlayerPlayPauseBtnState with _$CurrentPlayerPlayPauseBtnState {

  factory CurrentPlayerPlayPauseBtnState({
    @Default(false) bool isPlaying,
    @Default(false) bool isPaused,
    @Default(false) bool isLoading,
  }) = _CurrentPlayerPlayPauseBtnState;
}

@freezed
class AudioPlayerOtherBtnState with _$AudioPlayerOtherBtnState {

  factory AudioPlayerOtherBtnState({
    @Default(false) bool isNextTrackAvailable,
    @Default(false) bool isPrevTrackAvailable,
    @Default(false) bool isRepeatModeEnabled,
    @Default(false) bool isShuffleModeEnabled,
  }) = _AudioPlayerOtherBtnState;
}
