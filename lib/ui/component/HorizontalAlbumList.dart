import 'package:flutter/cupertino.dart';
import 'package:praxis_flutter/design_system/spotify_vertical_img_card.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';

class HorizontalAlbumList extends StatelessWidget {
  final List<AlbumUiModel> albumList;
  final String albumName;

  const HorizontalAlbumList(
      {Key? key, required this.albumName, required this.albumList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(albumList.length, (index) {
          var currentItem = albumList[index];
          return Expanded(
            child: SpotifyVerticalImageCard(
              imageUrl: currentItem.thumbnailImageUrl,
              label: currentItem.label,
              isPlaying: false,
              albumId: currentItem.albumId,
              onTap: () {
                // On Pressed
              },
              artistName: currentItem.artist.artistName,
            ),
          );
        }),
      ),
    );
  }
}
