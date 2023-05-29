import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';

class SpotifyHorizontalImageCard extends StatelessWidget {

  final String imageUrl;
  final String label;
  final bool isPlaying;
  final String albumId;
  final void Function() onTap;

  const SpotifyHorizontalImageCard({
    Key? key,
    required this.imageUrl,
    required this.label,
    required this.isPlaying,
    required this.albumId,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: spotifyLightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
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
                    label,
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
      ),
    );
  }
}
