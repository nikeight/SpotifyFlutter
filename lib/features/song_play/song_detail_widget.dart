import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/audio_player_manager_cubit.dart';
import 'package:praxis_flutter/features/song_play/bloc/audio_player_manager_bloc.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter/models/ui_state.dart';

class SongPlayDetailWidget extends StatelessWidget {
  final TrackUiModel trackUiModel;

  const SongPlayDetailWidget(this.trackUiModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerManagerBloc, AudioPlayerManagerBlocState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffE0DECA),
          title: Text(
            (state is CurrentPlayerSongTitleState)
                ? (state).songTitle ?? ""
                : "Album Name",
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.black45),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.black54,
            )
          ],
        ),
        body: Container(
          color: const Color(0xffE0DECA),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Text(
                  (state is CurrentPlayerArtistNameState)
                      ? state.artistName
                      : "Track Artist Name",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
              Text(
                  (state is CurrentPlayerSongTitleState)
                      ? state.songTitle
                      : "Track Song Title",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(color: Colors.black45, fontSize: 14)),
              const SizedBox(height: 24),
              SizedBox(
                width: 340,
                height: 300,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image(
                    image: NetworkImage(
                      randomSpotifyCoverPages[
                          Random().nextInt(randomSpotifyCoverPages.length)],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Slider(
                min: 0,
                max: 30,
                // (state is CurrentSongProgressBarState)
                //     ? state.totalLength.toDouble()
                //     : 100,
                divisions: 30,
                // (state is CurrentSongProgressBarState)
                //     ? state.totalLength
                //     : 100,
                activeColor: Colors.white70,
                inactiveColor: Colors.grey,
                thumbColor: Colors.white,
                value: (state is CurrentSongProgressBarState)
                    ? state.currentPosition.toDouble()
                    : 0,
                onChanged: (newValue) {
                  // Change the value of the Seeker from here
                  final duration = Duration(seconds: newValue.toInt());
                  context
                      .read<AudioPlayerManagerBloc>()
                      .add(AudioPlayerSeekPositionEvent(duration: duration));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        (state is CurrentSongProgressBarState)
                            ? state.currentPosition.toString()
                            : "0.00",
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Text(
                        (state is CurrentSongProgressBarState)
                            ? state.totalLength.toString()
                            : "0.00",
                        style: const TextStyle(
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
                      onPressed: () {
                        context
                            .read<AudioPlayerManagerBloc>()
                            .add(AudioPlayerShuffleTrackEvent());
                      },
                      icon: const Icon(Icons.shuffle_sharp)),
                  IconButton(
                      iconSize: 42,
                      onPressed: () {
                        context
                            .read<AudioPlayerManagerBloc>()
                            .add(AudioPlayerPreviousTrackEvent());
                      },
                      icon: const Icon(Icons.skip_previous)),
                  Stack(
                    children: [
                      (state is CurrentSongPlayButtonState)
                          ? state.isLoading
                              ? const CircularProgressIndicator()
                              : state.isPlaying
                                  ? IconButton(
                                      iconSize: 62,
                                      onPressed: () {
                                        context
                                            .read<AudioPlayerManagerBloc>()
                                            .add(AudioPlayerPauseEvent());
                                      },
                                      icon: const Icon(Icons.play_circle_fill),
                                    )
                                  : IconButton(
                                      iconSize: 62,
                                      onPressed: () {
                                        context
                                            .read<AudioPlayerManagerBloc>()
                                            .add(AudioPlayerPlayEvent());
                                      },
                                      icon: const Icon(Icons.pause),
                                    )
                          : IconButton(
                              iconSize: 62,
                              onPressed: () {
                                context
                                    .read<AudioPlayerManagerBloc>()
                                    .add(AudioPlayerPlayEvent());
                              },
                              icon: const Icon(Icons.pause),
                            )
                    ],
                  ),
                  IconButton(
                      iconSize: 42,
                      onPressed: () {
                        context
                            .read<AudioPlayerManagerBloc>()
                            .add(AudioPlayerNextTrackEvent());
                      },
                      icon: const Icon(Icons.skip_next)),
                  IconButton(
                      iconSize: 24,
                      onPressed: () {
                        context.read<AudioPlayerManagerBloc>().add(
                            const AudioPlayerRepeatTrackEvent(
                                repeatState: RepeatState.REPEAT_SONG));
                      },
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
        ),
      );
    });
  }
}
