import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/host/spotify_carousel_host_cubit.dart';
import 'package:praxis_flutter/features/song_play/song_detail_screen.dart';

/// A widget to host the Carousel for all the tacks in a Album
/// Returns the SongPlay Screen where user can control the
/// actions of Playing Song, eg : Play,Pause,Next,Shuffle.

class SongCarouselHost extends StatelessWidget {
  const SongCarouselHost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting the Initial Page for the PageView.Builder
    return BlocProvider(
      create: (context) => SpotifyCarouselHostCubit(),
      child: BlocBuilder<SpotifyCarouselHostCubit, SpotifyCarouselHostState>(
        builder: (context, state) {
          // Updating the Index
          final PageController pageController =
              PageController(initialPage: state.currentIndex);

          // Updating the UI
          return state.trackItemList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: PageView.builder(
                    itemCount: state.trackItemList.length ?? 0,
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {},
                    itemBuilder: (BuildContext context, int index) {
                      return const SongDetailScreen();
                    },
                  ),
                );
        },
      ),
    );
  }
}
