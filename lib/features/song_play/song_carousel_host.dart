import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/song_play/song_detail_screen.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import '../../models/ui_state.dart';

/// A widget to host the Carousel for all the tacks in a Album
/// Returns the SongPlay Screen where user can control the
/// actions of Playing Song, eg : Play,Pause,Next,Shuffle.

class SongCarouselHost extends StatelessWidget {
  final TrackUiModel trackUiModel;

  const SongCarouselHost({Key? key, required this.trackUiModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting the Initial Page for the PageView.Builder
    final PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: PageView.builder(
        itemCount: trackUiModel.itemList.length,
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {},
        itemBuilder: (BuildContext context, int index) {
          return SongDetailScreen(trackUiModel);
        },
      ),
    );
  }
}
