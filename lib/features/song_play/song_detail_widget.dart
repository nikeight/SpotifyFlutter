import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/bloc/audio_player_manager_bloc.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';

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
          title: const Text(
            "Testing Album",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black45),
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
                  state.audioPlayerStateModel.currentTrackDetailState
                          ?.trackTitle ??
                      "Title Value null",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
              Text(
                  state.audioPlayerStateModel.currentTrackDetailState
                          ?.artistName ??
                      "Artist Value null",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(color: Colors.black45, fontSize: 14)),
              const SizedBox(height: 24),
              const SizedBox(
                width: 340,
                height: 300,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image(
                    image: NetworkImage(
                        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png"),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Slider(
                min: 0,
                max: state.audioPlayerStateModel.currentProgressBarState
                        ?.totalProgress
                        .toDouble() ??
                    0.0,
                activeColor: Colors.white70,
                inactiveColor: Colors.grey,
                thumbColor: Colors.white,
                value: state.audioPlayerStateModel.currentProgressBarState
                        ?.currentProgress
                        .toDouble() ??
                    0.0,
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
                        state.audioPlayerStateModel.currentProgressBarState
                                ?.currentProgress
                                .toString() ??
                            "Null Current",
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Text(
                        state.audioPlayerStateModel.currentProgressBarState
                                ?.totalProgress
                                .toString() ??
                            "Null Total",
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
                  state.audioPlayerStateModel.audioPlayerOtherBtnState
                              ?.isRepeatModeEnabled ??
                          false
                      ? IconButton(
                          iconSize: 24,
                          onPressed: () {
                            context
                                .read<AudioPlayerManagerBloc>()
                                .add(AudioPlayerShuffleTrackEvent());
                          },
                          icon: const Icon(
                            Icons.shuffle_sharp,
                            color: Colors.orange,
                          ),
                        )
                      : IconButton(
                          iconSize: 24,
                          onPressed: () {
                            context
                                .read<AudioPlayerManagerBloc>()
                                .add(AudioPlayerShuffleTrackEvent());
                          },
                          icon: const Icon(
                            Icons.shuffle_sharp,
                          ),
                        ),
                  state.audioPlayerStateModel.audioPlayerOtherBtnState
                              ?.isPrevTrackAvailable ??
                          false
                      ? IconButton(
                          iconSize: 42,
                          onPressed: () {},
                          icon: const Icon(Icons.square_sharp),
                        )
                      : IconButton(
                          iconSize: 42,
                          onPressed: () {
                            context
                                .read<AudioPlayerManagerBloc>()
                                .add(AudioPlayerPreviousTrackEvent());
                          },
                          icon: const Icon(Icons.skip_previous),
                        ),
                  Stack(
                    children: [
                      state.audioPlayerStateModel.currentPlayerPlayPauseBtnState
                                  ?.isLoading ??
                              false
                          ? const CircularProgressIndicator()
                          : state
                                      .audioPlayerStateModel
                                      .currentPlayerPlayPauseBtnState
                                      ?.isPlaying ??
                                  false
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
                    ],
                  ),
                  state.audioPlayerStateModel.audioPlayerOtherBtnState
                              ?.isPrevTrackAvailable ??
                          false
                      ? IconButton(
                          iconSize: 42,
                          onPressed: () {},
                          icon: const Icon(Icons.crop_square),
                        )
                      : IconButton(
                          iconSize: 42,
                          onPressed: () {
                            context
                                .read<AudioPlayerManagerBloc>()
                                .add(AudioPlayerNextTrackEvent());
                          },
                          icon: const Icon(Icons.skip_next),
                        ),
                  state.audioPlayerStateModel.audioPlayerOtherBtnState
                              ?.isShuffleModeEnabled ??
                          false
                      ? IconButton(
                          iconSize: 24,
                          onPressed: () {
                            context.read<AudioPlayerManagerBloc>().add(
                                  const AudioPlayerRepeatTrackEvent(
                                      repeatState: RepeatState.REPEAT_SONG),
                                );
                          },
                          icon: const Icon(
                            Icons.repeat_outlined,
                            color: Colors.orange,
                          ),
                        )
                      : IconButton(
                          iconSize: 24,
                          onPressed: () {
                            context.read<AudioPlayerManagerBloc>().add(
                                  const AudioPlayerRepeatTrackEvent(
                                      repeatState: RepeatState.REPEAT_SONG),
                                );
                          },
                          icon: const Icon(
                            Icons.repeat,
                          ),
                        )
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
