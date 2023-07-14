import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/spotify_min_player/miniplayer.dart';
import 'package:praxis_flutter/features/spotify_search/host/spotify_search_host.dart';
import 'package:praxis_flutter/features/spotify_search/host/spotify_search_host_cubit.dart';
import 'package:praxis_flutter/features/spotify_library/spotify_library_screen.dart';
import 'package:praxis_flutter/navigation/NavigationState.dart';
import 'package:praxis_flutter/navigation/bottom_navigation_cubit.dart';

import '../spotify_profile/spotify_profile_cubit.dart';
import '../spotify_profile/spotify_profile_view.dart';

class SpotifyHostScreen extends StatelessWidget {
  const SpotifyHostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (BuildContext context) => BottomNavigationCubit(),
        ),
        BlocProvider<SpotifyProfileCubit>(
          create: (BuildContext context) => SpotifyProfileCubit(),
        ),
        BlocProvider<SpotifySearchHostCubit>(
          create: (BuildContext context) => SpotifySearchHostCubit(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar:
        BlocBuilder<BottomNavigationCubit, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: spotifyBlack,
              fixedColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: state.index,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_library,
                    color: Colors.white,
                  ),
                  label: 'Library',
                ),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    BlocProvider.of<BottomNavigationCubit>(context)
                        .getNavBarItem(NavigationBottomBarItems.PROFILE);
                    break;
                  case 1:
                    BlocProvider.of<BottomNavigationCubit>(context)
                        .getNavBarItem(NavigationBottomBarItems.SEARCH);
                    break;
                  case 2:
                    BlocProvider.of<BottomNavigationCubit>(context)
                        .getNavBarItem(NavigationBottomBarItems.LIBRARY);
                    break;
                }
              },
            );
          },
        ),
        body: Align(
          alignment: Alignment.center,
          child: BlocBuilder<BottomNavigationCubit, NavigationState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: state.navbarItem == NavigationBottomBarItems
                              .PROFILE ? const SpotifyProfileScreen() : state
                              .navbarItem == NavigationBottomBarItems.SEARCH
                              ? const SpotifySearchHostScreen()
                              : state.navbarItem ==
                              NavigationBottomBarItems.LIBRARY
                              ? const SpotifyLibraryScreen()
                              : const CircularProgressIndicator(),
                        ),
                        const StateFulMiniPlayer()
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
