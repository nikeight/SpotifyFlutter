import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../design_system/spotify_color.dart';

class SongListItemView extends StatelessWidget {

  final String imageUrl;
  final String songName;
  final String artistName;
  final bool isPlaying;
  final void Function() onTap;

  const SongListItemView({Key? key, required this.imageUrl, required this.songName, required this.artistName, required this.isPlaying, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 40,
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
                      child:  Text(
                        songName,
                        overflow: TextOverflow.ellipsis,
                        style:  const TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color:  Color(0xFF212121),
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
