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

  const SongCard({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo : Wrap the Image as per the Container Size (Radius as well)
    return GestureDetector(
      onTap: () {
        context.push(songPlayRoute);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(0))),
        height: 200,
        width: 200,
        child: Stack(
          children: [
            Positioned.fill(child: Image.network(song.songPosterUrl)),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(children: [
                Text(
                  song.songName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: Colors.black),
                ),
                Text(
                  song.songAuthor,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black45),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
