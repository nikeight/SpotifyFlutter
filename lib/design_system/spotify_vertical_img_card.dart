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
    this.imageUrl =
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
    required this.label,
    required this.isPlaying,
    required this.albumId,
    required this.onTap,
    required this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              height: 120,
            ),
            verticalSpaceSmall,
            Text(label),
            verticalSpaceSmall,
            Text(artistName),
            verticalSpaceSmall
          ],
        ),
      ),
    );
  }
}
