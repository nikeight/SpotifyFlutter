import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/song_play/song_detail_screen.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import '../../models/ui_state.dart';

class SongCarouselHost extends StatelessWidget {
  final TrackUiModel trackUiModel;

  const SongCarouselHost({Key? key, required this.trackUiModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting the Initial Page for the PageView.Builder
    final PageController pageController = PageController(initialPage: 0);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffE0DECA),
          title: const Text(
            "Top Albums 🔝",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black45),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.black54,
            )
          ],
        ),
        body: PageView.builder(
          itemCount: trackUiModel.itemList.length,
          controller: pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {},
          itemBuilder: (BuildContext context, int index) {
            return const SongDetailScreen();
          },
        ),
      ),
    );
  }
}
