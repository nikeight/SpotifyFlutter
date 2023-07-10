import 'package:flutter/cupertino.dart';
import 'package:praxis_flutter/design_system/spotify_vertical_img_card.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';

/// A Components
/// TO Display Horizontal List in the Home Screen
/// Contains a List with Vertical Cards with Details

class HorizontalAlbumList extends StatelessWidget {
  final List<AlbumUiModel> albumList;
  final String albumName;

  const HorizontalAlbumList(
      {Key? key, required this.albumName, required this.albumList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height / 4;
    final itemWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: itemHeight,
      width: itemWidth,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(albumList.length, (index) {
          var currentItem = albumList[index];
          return SpotifyVerticalImageCard(
            imageUrl: currentItem.thumbnailImageUrl,
            label: currentItem.label,
            isPlaying: false,
            albumId: currentItem.albumId,
            onTap: () {
              // On Pressed
            },
            artistName: currentItem.artist.artistName,
          );
        }),
      ),
    );
  }
}
