import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/song_play_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class SongPlayDetailWidget extends StatelessWidget {
  final SongUiModel song;

  const SongPlayDetailWidget({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayCubit, UiState<bool>>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Positioned.fill(
                child: Image(
                    height: 400,
                    width: 400,
                    image: NetworkImage(song.songPosterUrl))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [Text(song.songName), Text(song.songAuthor)],
                ),
                IconButton(
                    onPressed: () {
                      // Heart Icon Pressed
                      SongPlayCubit().toggleFavAlbum(song);
                    },
                    icon: (state is Success)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Slider(
                  min: 0,
                  max: 100,
                  divisions: 100,
                  activeColor: Colors.grey,
                  inactiveColor: Colors.green,
                  thumbColor: Colors.red,
                  value: 20,
                  onChanged: (newValue) {
                    // Change the value of the Seeker from here
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 32,
                    onPressed: () {},
                    icon: const Icon(Icons.shuffle)),
                IconButton(
                    iconSize: 32,
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous)),
                IconButton(
                    iconSize: 44,
                    onPressed: () {},
                    icon: const Icon(Icons.play_circle)),
                IconButton(
                    iconSize: 32,
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next)),
                IconButton(
                    iconSize: 32,
                    onPressed: () {},
                    icon: const Icon(Icons.repeat)),
              ],
            )
          ],
        ),
      );
    });
  }
}
