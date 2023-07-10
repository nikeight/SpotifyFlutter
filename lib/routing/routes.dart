import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/song_list/SongListScreen.dart';
import 'package:praxis_flutter/features/song_play/song_carousel_host.dart';
import 'package:praxis_flutter/features/spotify_home/spotify_home_screen.dart';
import 'package:praxis_flutter/features/spotify_library/spotify_library_screen.dart';
import 'package:praxis_flutter/features/spotify_profile/spotify_profile_view.dart';
import 'package:praxis_flutter/features/spotify_search/host/spotify_search_host.dart';
import 'package:praxis_flutter/features/spotify_search/search/spotify_search_bloc.dart';
import 'package:praxis_flutter/features/spotify_search/search/spotify_search_screen.dart';
import 'package:praxis_flutter/features/spotify_splash/SpotifySplashScreen.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'ScaffoldWithNestedNavigation.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();
final _profileNavigationKey = GlobalKey<NavigatorState>(debugLabel: "profile");
final _searchNavigationKey = GlobalKey<NavigatorState>(debugLabel: "search");
final _libraryNavigationKey = GlobalKey<NavigatorState>(debugLabel: "library");

const rootRoute = '/';

// Song Carousel for Media Player
const songCarouselHostPathRoute = "/songCarouselHost";
const songCarouselHostPathRouteName = "songCarouselHostPathName";

// Track ID can be anything : Album Id, Playlist Id, TYPE is String
const trackListScreenRouteName = "trackListScreen";
const trackListScreenRoute = "$trackListScreenRouteName/:trackId";

// CAUTION ⚠️ : Removed "/" from the Name and Route in order to make navigation work
// Search Screen Routes Variable
const searchScreenRoute = "searchScreenRoute";
const searchScreenRouteName = "searchScreenRoutePathName";

final praxisRoutes = GoRouter(
  initialLocation: rootRoute,
  navigatorKey: _rootNavigationKey,
  debugLogDiagnostics: true,
  routes: [
    splashRoute(),
    songsCarouselHostRoute(),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _profileNavigationKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SpotifyProfileScreen(),
              ),
              routes: [
                GoRoute(
                  name: trackListScreenRouteName,
                  path: trackListScreenRoute,
                  builder: (context, state) => SongListScreen(
                      trackId: state.pathParameters['trackId'] ?? ""),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _searchNavigationKey,
          routes: [
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SpotifySearchHostScreen(),
              ),
              routes: [
                GoRoute(
                  name: searchScreenRouteName,
                  path: searchScreenRoute,
                  builder: (context, state) => const SpotifySearchScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _libraryNavigationKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/library',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SpotifyLibraryScreen(),
              ),
              routes: const [
                // No Routes Defined till now.
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRoute splashRoute() {
  return GoRoute(
    path: rootRoute,
    parentNavigatorKey: _rootNavigationKey,
    builder: (context, state) => const SpotifySplashScreen(),
  );
}

GoRoute songsCarouselHostRoute() {
  return GoRoute(
    path: songCarouselHostPathRoute,
    name: songCarouselHostPathRouteName,
    parentNavigatorKey: _rootNavigationKey,
    builder: (context, state) {
      TrackUiModel trackUiModel = state.extra as TrackUiModel;
      return SongCarouselHost(trackUiModel: trackUiModel);
    },
  );
}
