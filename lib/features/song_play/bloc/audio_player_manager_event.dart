part of 'audio_player_manager_bloc.dart';

abstract class AudioPlayerManagerEvent extends Equatable {
  const AudioPlayerManagerEvent();

  @override
  List<Object?> get props => [];
}

// Load Data at the Initial Steps
// Pass the Track Details to Bloc
class LoadDataAndInitializePlayerEvent extends AudioPlayerManagerEvent {
  final TrackUiModel trackUiModel;

  const LoadDataAndInitializePlayerEvent({required this.trackUiModel});

  @override
  List<Object?> get props => [trackUiModel];
}

// This will update the whole UI at each other Event
class UpdateCompleteUiEvent extends AudioPlayerManagerEvent {
  final AudioPlayerManagerBlocState audioPlayerManagerBlocState;

  const UpdateCompleteUiEvent(this.audioPlayerManagerBlocState);

  @override
  // TODO: implement props
  List<Object?> get props => [audioPlayerManagerBlocState];
}

// Play Event
class AudioPlayerPlayEvent extends AudioPlayerManagerEvent {}

// Update Track Title and Artist
class UpdateTrackTitleAndArtistEvent extends AudioPlayerManagerEvent {}

// Pause Event
class AudioPlayerPauseEvent extends AudioPlayerManagerEvent {}

// Next Track Event
class AudioPlayerNextTrackEvent extends AudioPlayerManagerEvent {}

// Previous Track Event
class AudioPlayerPreviousTrackEvent extends AudioPlayerManagerEvent {}

// Update SeekBar position Event
class AudioPlayerSeekPositionEvent extends AudioPlayerManagerEvent {
  final Duration duration;

  const AudioPlayerSeekPositionEvent({required this.duration});

  @override
  List<Object?> get props => [duration];
}

// Update Shuffle Mode Event
class AudioPlayerShuffleTrackEvent extends AudioPlayerManagerEvent {}

// Update Repeat Mode Event
class AudioPlayerRepeatTrackEvent extends AudioPlayerManagerEvent {
  final RepeatState repeatState;

  const AudioPlayerRepeatTrackEvent({required this.repeatState});

  @override
  List<Object?> get props => [repeatState];
}

// Mark any Track as Fav Event
class FavouriteTrackEvent extends AudioPlayerManagerEvent {}

enum RepeatState { OFF, REPEAT_SONG, REPEAT_PLAYLIST }
