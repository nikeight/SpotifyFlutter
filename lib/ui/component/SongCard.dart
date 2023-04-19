import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

/*
Todo : Add Placeholder image for Network Image;

  A Common Widget which takes `Song` Object to showcase
    - Album Name
    - Artist Name
    - Album ImageUrl
    - IsFav State ( Only Showing )
    - a clickListener to Open the `PlaySongScreen`
 */
class SongCard extends StatelessWidget {
  final SongUiModel song;
  final int index;

  const SongCard({Key? key, required this.song, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .pushNamed(songPlayRouteName, params: {'index': index.toString()});
      },
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(song.songPosterUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black12,
                      Colors.black45,
                      Colors.black54,
                      Colors.black
                    ])),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.songName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        song.songAuthor,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
