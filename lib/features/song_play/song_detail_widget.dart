import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/song_play_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';

class SongPlayDetailWidget extends StatelessWidget {
  const SongPlayDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayCubit, UiState<bool>>(builder: (context, state) {
      print("State Changed to $state");
      return Container(
        color: const Color(0xffE0DECA),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            const Text("Song Artist",
                textAlign: TextAlign.left,
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.black, fontSize: 18)),
            const Text("Song Name",
                textAlign: TextAlign.left,
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.black45, fontSize: 14)),
            const SizedBox(height: 24),
            const SizedBox(
              width: 340,
              height: 300,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image(image: NetworkImage("https://google.com")),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.outbox_sharp, size: 32),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.nightlight,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Heart Icon Pressed
                    // context.read<SongPlayCubit>().toggleFavAlbum(song);
                  },
                  icon: (state is Success)
                      ? (state as Success).data
                          ? const Icon(
                              Icons.favorite,
                              size: 32,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              size: 32,
                            )
                      : const Icon(Icons.favorite_border, size: 32),
                )
              ],
            ),
            Slider(
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Colors.white70,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
              value: 20,
              onChanged: (newValue) {
                // Change the value of the Seeker from here
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("0.00",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  Text("-4.46",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: const Icon(Icons.shuffle_sharp)),
                IconButton(
                    iconSize: 42,
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous)),
                IconButton(
                    iconSize: 62,
                    onPressed: () {},
                    icon: const Icon(Icons.play_circle_fill)),
                IconButton(
                    iconSize: 42,
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next)),
                IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: const Icon(Icons.repeat_outlined)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: const Icon(Icons.devices)),
                IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: const Icon(Icons.library_music)),
              ],
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Container(
                height: 52,
                color: const Color(0xff6096B4),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Lyrics",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.open_in_full_rounded,
                            size: 18,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
