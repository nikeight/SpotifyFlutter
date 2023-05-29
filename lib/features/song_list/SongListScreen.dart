import 'package:flutter/widgets.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter/ui/component/SongListItemView.dart';

class SongListScreen extends StatelessWidget {
  final TrackUiModel trackUiModel;

  const SongListScreen(this.trackUiModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      children: List.generate(trackUiModel.itemList.length, (index) {
        var currentItem = trackUiModel.itemList[index];
        return SongListItemView(
            imageUrl: currentItem.thumbnailUrl,
            songName: currentItem.durationInMs.toString() ,
            artistName: currentItem.durationInMs.toString(),
            isPlaying: false,
            onTap: () {
              // Navigate to the SongPlay Screen
            },
        );
      }),
    );
  }
}
