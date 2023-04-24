import 'package:flutter/material.dart';

import 'SongCard.dart';

class GridSongCardWidget extends StatelessWidget {
  final List<String> songList = ["something"];

  GridSongCardWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(6, (index) {
        final currentItem = songList[index];
        return Container(
          height: 240,
          width: 180,
          margin: const EdgeInsets.all(4),
          child: SongCard(
            index: index,
          ),
        );
      }),
    );
  }
}
