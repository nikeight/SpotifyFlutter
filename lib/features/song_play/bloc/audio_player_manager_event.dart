part of 'audio_player_manager_bloc.dart';

abstract class AudioPlayerManagerEvent extends Equatable {
  const AudioPlayerManagerEvent();

  @override
  List<Object?> get props => [];
}

class LoadDataAndInitializePlayerEvent extends AudioPlayerManagerEvent {
  final TrackUiModel trackUiModel;

  const LoadDataAndInitializePlayerEvent({required this.trackUiModel});

  @override
  List<Object?> get props => [trackUiModel];
}
class AudioPlayerCurrentTrackArtistEvent extends AudioPlayerManagerEvent {}

class AudioPlayerCurrentTrackTitleEvent extends AudioPlayerManagerEvent {}

class AudioPlayerPlayEvent extends AudioPlayerManagerEvent {}

class AudioPlayerPauseEvent extends AudioPlayerManagerEvent {}

class AudioPlayerNextTrackEvent extends AudioPlayerManagerEvent {}

class AudioPlayerPreviousTrackEvent extends AudioPlayerManagerEvent {}

class AudioPlayerSeekPositionEvent extends AudioPlayerManagerEvent {
  final Duration duration;

  const AudioPlayerSeekPositionEvent({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class AudioPlayerShuffleTrackEvent extends AudioPlayerManagerEvent {}

class AudioPlayerRepeatTrackEvent extends AudioPlayerManagerEvent {
  final RepeatState repeatState;

  const AudioPlayerRepeatTrackEvent({required this.repeatState});

  @override
  List<Object?> get props => [repeatState];
}

class FavouriteTrackEvent extends AudioPlayerManagerEvent {}


enum RepeatState { OFF, REPEAT_SONG, REPEAT_PLAYLIST }