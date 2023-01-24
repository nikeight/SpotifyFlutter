import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/spotify_home/component/SearchComponent.dart';
import 'package:praxis_flutter/features/spotify_home/component/SongCard.dart';

class AllSongScreen extends StatelessWidget {
  const AllSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SearchComponent(),
          const SizedBox(height: 8,),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return Container(
                height: 240,
                width: 180,
                margin: const EdgeInsets.all(4),
                child: const SongCard(),
              );
            }),
          )
        ],
      ),
    );
  }
}
