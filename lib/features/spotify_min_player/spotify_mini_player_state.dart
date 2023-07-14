part of 'spotify_mini_player_bloc.dart';

class SpotifyMiniPlayerEnableState {
  final bool isMiniPlayerIdle;
  final bool isPlaying;
  final bool isLoading;
  final String trackTitle;
  final String trackArtist;
  final String trackCoverUrl;
  final int currentProgressState;
  final int totalProgressValue;

  SpotifyMiniPlayerEnableState({
    required this.isMiniPlayerIdle,
    required this.isPlaying,
    required this.isLoading,
    required this.trackTitle,
    required this.trackArtist,
    required this.trackCoverUrl,
    required this.currentProgressState,
    required this.totalProgressValue,
  });

  factory SpotifyMiniPlayerEnableState.initial() => SpotifyMiniPlayerEnableState(
      isMiniPlayerIdle: true,
      isPlaying: false,
      isLoading: false,
      trackTitle: "Track Null",
      trackArtist: "Artist Null",
      trackCoverUrl:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
      currentProgressState: 0,
      totalProgressValue: 0);

  SpotifyMiniPlayerEnableState copyWith(
      {bool? isMiniPlayerIdle,
      bool? isPlaying,
      bool? isLoading,
      String? trackTitle,
      String? trackArtist,
      String? trackCoverUrl =
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
      int? currentProgressState,
      int? totalProgressValue}) {
    return SpotifyMiniPlayerEnableState(
        isMiniPlayerIdle: isMiniPlayerIdle ?? true,
        isPlaying: isPlaying ?? false,
        isLoading: isLoading ?? false,
        trackTitle: trackTitle ?? "Track Null",
        trackArtist: trackArtist ?? "Artist Null",
        trackCoverUrl: trackCoverUrl ?? "https:google.com",
        currentProgressState: currentProgressState ?? 0,
        totalProgressValue: totalProgressValue ?? 0);
  }
}
