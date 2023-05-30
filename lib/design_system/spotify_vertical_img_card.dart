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
    return SizedBox(
      height: 100,
      width: 140,
      child: Card(
        color: spotifyLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          //set border radius more than 50% of height and width to make circle
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: 120,
                height: 140,
              ),
              verticalSpaceSmall,
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
              verticalSpaceSmall,
              Text(artistName),
              verticalSpaceSmall
            ],
          ),
        ),
      ),
    );
  }
}
