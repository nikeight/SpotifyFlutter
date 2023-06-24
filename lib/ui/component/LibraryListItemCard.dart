import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';

class LibraryListItemCard extends StatelessWidget {
  final AlbumUiModel albumUiModel;

  const LibraryListItemCard(this.albumUiModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      child: Card(
        shadowColor: spotifyWhiteGrey,
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 80,
              child: Image.network(albumUiModel.thumbnailImageUrl),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Artist Name : ${albumUiModel.artist.artistName}"),
                const Text("TYPE : Song/Playlist/Album"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
