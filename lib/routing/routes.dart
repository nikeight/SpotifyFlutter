import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/home/home_page.dart';
import 'package:praxis_flutter/features/joke_list/joke_list_page.dart';
import 'package:praxis_flutter/features/login/login_page.dart';
import 'package:praxis_flutter/features/song_play/song_play_screen.dart';
import 'package:praxis_flutter/features/splash/splash_page.dart';
import 'package:praxis_flutter/features/spotify_home/spotify_home_screen.dart';

const loginRoute = '/login';
const jokeListRoute = "/jokesList";
const homeRoute = '/home';
const rootRoute = '/';

// Shopify
const songPlayRoute = "/songPlay/:index";
const songPlayRouteName = "songPlay";

final praxisRoutes = GoRouter(
  routes: [
    splashRoute(),
    loginPageRoute(),
    homePageRoute(),
    jokeListRoutePage(),
    songPlayedRoute()
  ],
);

jokeListRoutePage() {
  return GoRoute(
    path: jokeListRoute,
    builder: (context, state) => const JokesPage(),
  );
}

GoRoute homePageRoute() {
  return GoRoute(
    path: homeRoute,
    builder: (context, state) => const HomePage(),
  );
}

GoRoute loginPageRoute() {
  return GoRoute(
    path: loginRoute,
    builder: (context, state) => const LoginPage(),
  );
}

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
      index: state.params['index'],
    ),
  );
}
