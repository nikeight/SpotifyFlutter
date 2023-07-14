import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/spotify_min_player/miniplayer.dart';
import 'package:praxis_flutter/features/spotify_min_player/spotify_mini_player_bloc.dart';
import 'package:praxis_flutter/features/spotify_profile/spotify_profile_cubit.dart';
import 'package:praxis_flutter/features/spotify_search/host/spotify_search_host_cubit.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpotifyProfileCubit>(
          create: (BuildContext context) => SpotifyProfileCubit(),
        ),
        BlocProvider<SpotifySearchHostCubit>(
          create: (BuildContext context) => SpotifySearchHostCubit(),
        ),
        // BlocProvider<SpotifyMiniPlayerBloc>(
        //   create: (BuildContext context) => SpotifyMiniPlayerBloc()
        //     ..add(CheckForProcessStateEvent())
        //     ..add(UpdateMiniPlayerArtistAndTrackDetails())
        //     ..add(PauseMiniPlayerEvent()),
        // ),
      ],
      child: Scaffold(
        backgroundColor: spotifyBlack,
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                child: navigationShell,
              ),
              const StateFulMiniPlayer(),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
                label: 'Profile',
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home, color: Colors.green)),
            NavigationDestination(
                label: 'Search',
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search, color: Colors.green)),
            NavigationDestination(
                label: 'Library',
                icon: Icon(Icons.library_add),
                selectedIcon: Icon(Icons.library_add, color: Colors.green)),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}
