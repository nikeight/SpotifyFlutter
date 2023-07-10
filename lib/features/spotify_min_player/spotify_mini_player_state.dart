part of 'spotify_mini_player_bloc.dart';

class SpotifyMiniPlayerEnableState {
  final bool isPlaying;
  final String trackTitle;
  final String trackArtist;
  final String trackCoverUrl;
  final int currentProgressState;
  final int totalProgressValue;

  SpotifyMiniPlayerEnableState(
    this.isPlaying,
    this.trackTitle,
    this.trackArtist,
    this.trackCoverUrl,
    this.currentProgressState,
    this.totalProgressValue,
  );

  factory SpotifyMiniPlayerEnableState.initial() => SpotifyMiniPlayerEnableState(
      false,
      "Track Null",
      "Artist Null",
      "https://i.pinimg.com/736x/1c/22/bd/1c22bd48c7aa98182ba78d7ce55030b0.jpg",
      0,
      0);

  SpotifyMiniPlayerEnableState copyWith(
      {bool? isPlaying,
      String? trackTitle,
      String? trackArtist,
      String? trackCoverUrl =
          "https://i.pinimg.com/736x/1c/22/bd/1c22bd48c7aa98182ba78d7ce55030b0.jpg",
      int? currentProgressState,
      int? totalProgressValue}) {
    return SpotifyMiniPlayerEnableState(
        isPlaying ?? false,
        trackTitle ?? "Track Null",
        trackArtist ?? "Artist Null",
        trackCoverUrl ?? "https:google.com",
        currentProgressState ?? 0,
        totalProgressValue ?? 0);
  }
}
