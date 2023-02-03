import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/song_play/song_detail_screen.dart';
import 'package:praxis_flutter/features/song_play/song_detail_widget.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class SongPlayScreen extends StatelessWidget {
  final String songName;

  const SongPlayScreen({Key? key, this.songName = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(songName),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          print("At Index $index");
        },
        itemBuilder: (BuildContext context, int index) {
          return const SongDetailScreen();
        },
      ),
    );
  }
}
