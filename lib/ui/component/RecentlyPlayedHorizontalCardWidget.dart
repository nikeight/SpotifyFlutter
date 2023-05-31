import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_horizontal_img_card.dart';
import 'package:praxis_flutter/routing/routes.dart';

import '../../models/AlbumUiModel.dart';

class RecentlyPlayedHorizontalCardWidget extends StatelessWidget {
  final List<AlbumUiModel> recentlyPlayedAlbums;

  const RecentlyPlayedHorizontalCardWidget(
      {Key? key, required this.recentlyPlayedAlbums})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        childAspectRatio: 4.0,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(
          recentlyPlayedAlbums.length,
          (index) {
            var currentItem = recentlyPlayedAlbums[index];
            return SpotifyHorizontalImageCard(
                imageUrl: currentItem.thumbnailImageUrl,
                label: currentItem.label,
                isPlaying: false,
                albumId: currentItem.albumId,
                onTap: () {
                  // Navigate to the SongList Screen and pass the Album Id ->
                  context
                      .pushNamed(trackListScreenRouteName, params: {'trackId': currentItem.albumId.toString()});
                });
          },
        ),
      ),
    );
  }
}
