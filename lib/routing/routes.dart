import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/song_list/SongListScreen.dart';
import 'package:praxis_flutter/features/song_play/song_carousel_host.dart';
import 'package:praxis_flutter/features/spotify_home/spotify_home_screen.dart';

const rootRoute = '/';

// Shopify
const songPlayRoute = "/songPlay/:index";
const songPlayRouteName = "songPlay";

// Track ID can be anything : Album Id, Playlist Id, TYPE is String
const trackListScreenRoute = "/$trackListScreenRouteName/:trackId";
const trackListScreenRouteName = "trackListScreen";

final praxisRoutes = GoRouter(
  routes: [splashRoute(), songPlayedRoute(),trackListRoute()],
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
      builder: (context, state) => SongListScreen(
          trackId : state.params['trackId'] ?? ""
      ));
}

GoRoute songPlayedRoute() {
  return GoRoute(
    path: songPlayRoute,
    name: songPlayRouteName,
    builder: (context, state) => SongCarouselHost(
      passedIndex: state.params['index'],
    ),
  );
}
