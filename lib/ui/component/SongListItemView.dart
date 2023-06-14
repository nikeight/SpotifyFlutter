import 'package:flutter/material.dart';
import '../../design_system/spotify_color.dart';

class SongListItemView extends StatelessWidget {
  final String imageUrl;
  final String songName;
  final String artistName;
  final bool isPlaying;
  final void Function() onTap;

  const SongListItemView(
      {Key? key,
      this.imageUrl =
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
      this.songName = "song Name",
      required this.artistName,
      required this.isPlaying,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: spotifyWhiteGrey,
      padding: const EdgeInsets.all(8),
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 60,
              width: 100,
              child: Row(
                children: [
                  Image.network(
                    imageUrl,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Text(
                        songName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.graphic_eq_sharp, color: primaryGreenColor),
                  const SizedBox(width: 8)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
