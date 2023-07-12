import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/design_system_example_view.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';

class SpotifyVerticalImageCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final bool isPlaying;
  final String albumId;
  final void Function() onTap;
  final String artistName;

  const SpotifyVerticalImageCard({
    Key? key,
    required this.imageUrl,
    required this.label,
    required this.isPlaying,
    required this.albumId,
    required this.onTap,
    required this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// The Height and Width is temporary set
    /// Todo : Needed to improve method or Calculation.
    /// TO make it Pixel Perfect UI.

    final itemHeight = MediaQuery.of(context).size.height / 3;
    final itemWidth = MediaQuery.of(context).size.width / 2.5;

    return SizedBox(
      height: itemHeight,
      width: itemWidth,
      child: Card(
        color: spotifyBlack,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: itemHeight / 1.7,
              ),
              Flexible(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    label,
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
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    artistName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
