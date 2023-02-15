import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/song_play/song_play_screen.dart';
import 'package:praxis_flutter/features/spotify_home/spotify_home_screen.dart';

const homeRoute = '/home';
const rootRoute = '/';

// Shopify
const songPlayRoute = "/songPlay/:index";
const songPlayRouteName = "songPlay";

final praxisRoutes = GoRouter(
  routes: [splashRoute(), songPlayedRoute()],
);

GoRoute splashRoute() {
  return GoRoute(
    path: rootRoute,
    builder: (context, state) => const SpotifyHomeScreen(),
  );
}

GoRoute songPlayedRoute() {
  return GoRoute(
    path: songPlayRoute,
    name: songPlayRouteName,
    builder: (context, state) => SongPlayScreen(
      passedIndex: state.params['index'],
    ),
  );
}
