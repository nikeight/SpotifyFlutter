import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/song_list/SongListScreen.dart';
import 'package:praxis_flutter/features/song_play/song_carousel_host.dart';
import 'package:praxis_flutter/features/spotify_home/spotify_home_screen.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';

const rootRoute = '/';

// Shopify
const songCarouselHostPathRoute = "/songCarouselHost";
const songCarouselHostPathRouteName = "songCarouselHostPathName";

// Track ID can be anything : Album Id, Playlist Id, TYPE is String
const trackListScreenRoute = "/$trackListScreenRouteName/:trackId";
const trackListScreenRouteName = "trackListScreen";

final praxisRoutes = GoRouter(
  routes: [splashRoute(), songsCarouselHostRoute(), trackListRoute()],
);

GoRoute splashRoute() {
  return GoRoute(
    path: rootRoute,
    builder: (context, state) => const SpotifyHostScreen(),
  );
}

// It Takes us to the List of Tracks based on the Album,PlayList Clicked.
GoRoute trackListRoute() {
  return GoRoute(
      path: trackListScreenRoute,
      name: trackListScreenRouteName,
      builder: (context, state) =>
          SongListScreen(trackId: state.params['trackId'] ?? ""));
}

GoRoute songsCarouselHostRoute() {
  return GoRoute(
    path: songCarouselHostPathRoute,
    name: songCarouselHostPathRouteName,
    builder: (context, state) {
      TrackUiModel trackUiModel = state.extra as TrackUiModel;
      return SongCarouselHost(trackUiModel: trackUiModel);
    },
  );
}
