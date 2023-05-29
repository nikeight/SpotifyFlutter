import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/design_system_example_view.dart';
import 'package:praxis_flutter/features/profile/spotify_profile_cubit.dart';
import 'package:praxis_flutter/features/profile/spotify_profile_view.dart';
import 'package:praxis_flutter/navigation/NavigationState.dart';
import 'package:praxis_flutter/navigation/bottom_navigation_cubit.dart';

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
      ],
      child: Scaffold(
        bottomNavigationBar:
            BlocBuilder<BottomNavigationCubit, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.index,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_library,
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
              switch (state.navbarItem) {
                case NavigationBottomBarItems.PROFILE:
                  return  const SpotifyProfileScreen();
                case NavigationBottomBarItems.SEARCH:
                  return  ExampleView();
                case NavigationBottomBarItems.LIBRARY:
                  return const Text("Library Screen");
              }
            },
          ),
        ),
      ),
    );
  }
}
