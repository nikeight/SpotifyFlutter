import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/all_song/all_song_screen.dart';
import 'package:praxis_flutter/features/fav_screen/fav_song_screen.dart';

class SpotifyHomeScreen extends StatelessWidget {
  const SpotifyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "All Songs",
              ),
              Tab(
                text: "Fav Songs",
              ),
            ],
          ),
          title: const Text('Spotify Clone'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [AllSongScreen(), FavSongScreen()],
        ),
      ),
    );
  }
}
