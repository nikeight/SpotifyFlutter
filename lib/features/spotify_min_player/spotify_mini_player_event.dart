part of 'spotify_mini_player_bloc.dart';

@immutable
abstract class SpotifyMiniPlayerEvent {}

class PlayMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class PauseMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class SwipeToNextMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class SwipeToPreviousMiniPlayerEvent extends SpotifyMiniPlayerEvent {}

class DragUpToOpenPlayerScreenEvent extends SpotifyMiniPlayerEvent {}

class UpdateMiniPlayerCurrentProgressStateEvent extends SpotifyMiniPlayerEvent {}

class UpdateMiniPlayerEvent extends SpotifyMiniPlayerEvent {
  SpotifyMiniPlayerEnableState currentState;

  UpdateMiniPlayerEvent(this.currentState);
}
