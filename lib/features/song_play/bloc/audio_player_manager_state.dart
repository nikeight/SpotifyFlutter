part of 'audio_player_manager_bloc.dart';

// Todo : Read about @immutable in Flutter Bloc Pattern

class AudioPlayerManagerBlocState extends Equatable {
  final String trackTitleName;
  final String trackArtistName;
  final List<String>? fetchedPlayList;
  final int progressBarTotalValue;
  final int progressBarBufferedValue;
  final int progressBarCurrentValue;
  final bool isAudioPlayerPlaying;
  final bool isAudioPlayerLoading;
  final bool isAudioPlayerPaused;
  final bool isShuffledModeEnabled;
  final bool isLastSongNotifierEnabled;
  final bool isFirstSongNotifierEnabled;
  final bool isRepeatSongModeEnabled;
  final bool isRepeatAlbumModeEnabled;

  const AudioPlayerManagerBlocState.initial(
      {this.trackTitleName = "Album Title",
      this.trackArtistName = "Album Artist Name",
      this.fetchedPlayList,
      this.progressBarTotalValue = 100,
      this.progressBarBufferedValue = 0,
      this.progressBarCurrentValue = 0,
      this.isAudioPlayerLoading = false,
      this.isAudioPlayerPlaying = false,
      this.isAudioPlayerPaused = true,
      this.isShuffledModeEnabled = false,
      this.isLastSongNotifierEnabled = true,
      this.isFirstSongNotifierEnabled = true,
      this.isRepeatSongModeEnabled = false,
      this.isRepeatAlbumModeEnabled = false});

  const AudioPlayerManagerBlocState.success({
    this.trackTitleName = "",
    this.trackArtistName = "",
    this.fetchedPlayList,
    this.progressBarTotalValue = 0,
    this.progressBarBufferedValue = 0,
    this.progressBarCurrentValue = 0,
    this.isAudioPlayerLoading = false,
    this.isAudioPlayerPlaying = false,
    this.isAudioPlayerPaused = false,
    this.isShuffledModeEnabled = false,
    this.isLastSongNotifierEnabled = false,
    this.isFirstSongNotifierEnabled = false,
    this.isRepeatSongModeEnabled = false,
    this.isRepeatAlbumModeEnabled = false,
  });

  @override
  List<Object?> get props => [
        trackTitleName,
        trackArtistName,
        fetchedPlayList,
        progressBarCurrentValue,
        progressBarBufferedValue,
        progressBarTotalValue,
        isAudioPlayerLoading,
        isAudioPlayerPaused,
        isAudioPlayerPlaying,
        isShuffledModeEnabled,
        isLastSongNotifierEnabled,
        isFirstSongNotifierEnabled,
        isRepeatSongModeEnabled,
        isRepeatAlbumModeEnabled,
      ];
}

// Nothing Happening : Initial State
// class InitialState extends AudioPlayerManagerBlocState {}
//
// // Changing Title of the Track
// class CurrentPlayerSongTitleState extends AudioPlayerManagerBlocState {
//   final String songTitle;
//
//   const CurrentPlayerSongTitleState({required this.songTitle});
//
//   @override
//   List<Object?> get props => [songTitle];
// }
//
// // Changing ArtistName of the Track
// class CurrentPlayerArtistNameState extends AudioPlayerManagerBlocState {
//   final String artistName;
//
//   const CurrentPlayerArtistNameState({required this.artistName});
//
//   @override
//   List<Object?> get props => [artistName];
// }
//
// class FetchedPlayListState extends AudioPlayerManagerBlocState {
//   final List<String> fetchedPlayList;
//
//   const FetchedPlayListState({required this.fetchedPlayList});
//
//   @override
//   List<Object?> get props => [fetchedPlayList];
// }
//
// class CurrentSongProgressBarState extends AudioPlayerManagerBlocState {
//   final int totalLength;
//   final int buffered;
//   final int currentPosition;
//
//   const CurrentSongProgressBarState(
//       {required this.currentPosition,
//       required this.buffered,
//       required this.totalLength});
//
//   @override
//   List<Object?> get props => [currentPosition, buffered, totalLength];
// }
//
// class CurrentSongPlayButtonState extends AudioPlayerManagerBlocState {
//   final bool isPlaying;
//   final bool isLoading;
//   final bool isPause;
//
//   const CurrentSongPlayButtonState(
//       {required this.isPlaying,
//       required this.isLoading,
//       required this.isPause});
//
//   @override
//   List<Object?> get props => [isPlaying, isLoading, isPause];
// }
//
// class IsPlayerShuffleMode extends AudioPlayerManagerBlocState {
//   final bool isShuffleModeEnabled;
//
//   const IsPlayerShuffleMode({required this.isShuffleModeEnabled});
//
//   @override
//   List<Object?> get props => [isShuffleModeEnabled];
// }
//
// class PlayerLastSongNotifier extends AudioPlayerManagerBlocState {
//   final bool isLastSongNotifier;
//
//   const PlayerLastSongNotifier({required this.isLastSongNotifier});
//
//   @override
//   List<Object?> get props => [isLastSongNotifier];
// }
//
// class PlayerFirstSongNotifier extends AudioPlayerManagerBlocState {
//   final bool isFirstSongNotifier;
//
//   const PlayerFirstSongNotifier({required this.isFirstSongNotifier});
//
//   @override
//   List<Object?> get props => [isFirstSongNotifier];
// }
//
// class PlayerRepeatModeState extends AudioPlayerManagerBlocState {
//   final bool isRepeatSongEnabled;
//   final bool isRepeatPlayListEnabled;
//
//   const PlayerRepeatModeState(
//       {required this.isRepeatSongEnabled,
//       required this.isRepeatPlayListEnabled});
//
//   @override
//   List<Object?> get props => [isRepeatSongEnabled, isRepeatPlayListEnabled];
// }
