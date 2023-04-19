import 'package:flutter/material.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

import 'SongCard.dart';

class GridSongCardWidget extends StatelessWidget {
  final List<SongUiModel> songList;

  const GridSongCardWidget({Key? key, required this.songList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(songList.length, (index) {
        final currentItem = songList[index];
        return Container(
          height: 240,
          width: 180,
          margin: const EdgeInsets.all(4),
          child: SongCard(
            song: currentItem,
            index: index,
          ),
        );
      }),
    );
  }
}
