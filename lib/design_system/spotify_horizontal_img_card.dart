import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';

/// A Component Used in the Recent Player Grid View
// Todo : Make the Playing State Icon to the Right Most Side
class SpotifyHorizontalImageCard extends StatelessWidget {
  // Todo : Convert this to an Object
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
    return Expanded(
      child: Card(
        color: spotifyLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                width: 60,
                height: MediaQuery.of(context).size.height,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    label,
                    maxLines: 2,
                    textAlign: TextAlign.start,
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
              const Padding(
                  padding: EdgeInsets.all(8),
                  child:
                      Icon(Icons.graphic_eq_sharp, color: primaryGreenColor)),
            ],
          ),
        ),
      ),
    );
  }
}
