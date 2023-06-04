part of 'audio_player_manager_bloc.dart';

// Todo : Read about @immutable in Flutter Bloc Pattern

abstract class AudioPlayerManagerBlocState extends Equatable {
  const AudioPlayerManagerBlocState();

  @override
  List<Object?> get props => [];
}

// Nothing Happening : Initial State
class InitialState extends AudioPlayerManagerBlocState {}

// Changing Title of the Track
class CurrentPlayerSongTitleState extends AudioPlayerManagerBlocState {
  final String songTitle;

  const CurrentPlayerSongTitleState({required this.songTitle});

  @override
  List<Object?> get props => [songTitle];
}

// Changing ArtistName of the Track
class CurrentPlayerArtistNameState extends AudioPlayerManagerBlocState {
  final String artistName;

  const CurrentPlayerArtistNameState({required this.artistName});

  @override
  List<Object?> get props => [artistName];
}

class FetchedPlayListState extends AudioPlayerManagerBlocState {
  final List<String> fetchedPlayList;

  const FetchedPlayListState({required this.fetchedPlayList});

  @override
  List<Object?> get props => [fetchedPlayList];
}

class CurrentSongProgressBarState extends AudioPlayerManagerBlocState {
  final int totalLength;
  final int buffered;
  final int currentPosition;

  const CurrentSongProgressBarState(
      {required this.currentPosition,
      required this.buffered,
      required this.totalLength});

  @override
  List<Object?> get props => [currentPosition, buffered, totalLength];
}

class CurrentSongPlayButtonState extends AudioPlayerManagerBlocState {
  final bool isPlaying;
  final bool isLoading;
  final bool isPause;

  const CurrentSongPlayButtonState(
      {required this.isPlaying,
      required this.isLoading,
      required this.isPause});

  @override
  List<Object?> get props => [isPlaying, isLoading, isPause];
}

class IsPlayerShuffleMode extends AudioPlayerManagerBlocState {
  final bool isShuffleModeEnabled;

  const IsPlayerShuffleMode({required this.isShuffleModeEnabled});

  @override
  List<Object?> get props => [isShuffleModeEnabled];
}

class PlayerLastSongNotifier extends AudioPlayerManagerBlocState {
  final bool isLastSongNotifier;

  const PlayerLastSongNotifier({required this.isLastSongNotifier});

  @override
  List<Object?> get props => [isLastSongNotifier];
}

class PlayerFirstSongNotifier extends AudioPlayerManagerBlocState {
  final bool isFirstSongNotifier;

  const PlayerFirstSongNotifier({required this.isFirstSongNotifier});

  @override
  List<Object?> get props => [isFirstSongNotifier];
}

class PlayerRepeatModeState extends AudioPlayerManagerBlocState {
  final bool isRepeatSongEnabled;
  final bool isRepeatPlayListEnabled;

  const PlayerRepeatModeState(
      {required this.isRepeatSongEnabled,
      required this.isRepeatPlayListEnabled});

  @override
  List<Object?> get props => [isRepeatSongEnabled, isRepeatPlayListEnabled];
}
