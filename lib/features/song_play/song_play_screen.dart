import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/song_play/song_detail_screen.dart';

class SongPlayScreen extends StatelessWidget {
  final String? index;

  const SongPlayScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: int.parse(index ?? "0"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Currently Playing"),
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
