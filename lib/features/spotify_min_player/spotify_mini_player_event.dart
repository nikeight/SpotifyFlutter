part of 'spotify_mini_player_bloc.dart';

@immutable
abstract class SpotifyMiniPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class PauseMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class SwipeToNextMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class SwipeToPreviousMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class DragUpToOpenPlayerScreenEvent extends SpotifyMiniPlayerEvent {}

class CheckForProcessStateEvent extends SpotifyMiniPlayerEvent {}

class UpdateMiniPlayerArtistAndTrackDetails extends SpotifyMiniPlayerEvent {}

class UpdateMiniPlayerCurrentProgressStateEvent
    extends SpotifyMiniPlayerEvent {}

class UpdateMiniPlayerEvent extends SpotifyMiniPlayerEvent {
  final SpotifyMiniPlayerEnableState currentState;

  UpdateMiniPlayerEvent(this.currentState);

  @override
  List<Object?> get props => [currentState];
}
