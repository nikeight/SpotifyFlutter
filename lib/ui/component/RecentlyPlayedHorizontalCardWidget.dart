import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_horizontal_img_card.dart';
import 'package:praxis_flutter/routing/routes.dart';

import '../../models/AlbumUiModel.dart';

/// Belongs to a Component :
/// - Show case the Six recent played Album/Playlist or anything
///
/// Internally all the Six Recent Played things will be cached in the database

class RecentlyPlayedHorizontalCardWidget extends StatelessWidget {
  final List<AlbumUiModel> recentlyPlayedAlbums;

  const RecentlyPlayedHorizontalCardWidget(
      {Key? key, required this.recentlyPlayedAlbums})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final gridItemViewHeight = MediaQuery.of(context).size.height / 12;
    final gridItemViewWidth = MediaQuery.of(context).size.width / 2;

    return SizedBox(
      height: gridItemViewHeight * 3,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        childAspectRatio: (gridItemViewWidth / gridItemViewHeight),
        shrinkWrap: true,
        crossAxisCount: 2,
        controller: ScrollController(keepScrollOffset: false),
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
                  context.pushNamed(trackListScreenRouteName, pathParameters: {
                    'trackId': currentItem.albumId.toString()
                  });
                });
          },
        ),
      ),
    );
  }
}
