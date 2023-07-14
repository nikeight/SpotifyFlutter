import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/spotify_min_player/spotify_mini_player_bloc.dart';
import 'package:praxis_flutter/routing/routes.dart';

class StateFulMiniPlayer extends StatefulWidget {
  const StateFulMiniPlayer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateFulMiniPlayerState();
}

class StateFulMiniPlayerState extends State<StateFulMiniPlayer> {
  final audioHandler = GetIt.I.get<AudioHandler>();

  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height / 10;

    // Checking the State of Audio Player
    return StreamBuilder<PlaybackState>(
      stream: audioHandler.playbackState,
      builder: (context, snapshot) {
        final playbackState = snapshot.data;
        final processingState = playbackState?.processingState;
        if (processingState == AudioProcessingState.idle) {
          return const SizedBox();
        }
        // Getting the Latest Media Player Streaming
        return StreamBuilder<MediaItem?>(
          stream: audioHandler.mediaItem,
          builder: (context, mediaItem) {
            return Dismissible(
              key: const Key("miniplayer"),
              direction: DismissDirection.up,
              confirmDismiss: (DismissDirection dismissDirection) {
                if (dismissDirection == DismissDirection.up) {
                  // Navigate to Audio Play Screen
                  context.push(songCarouselHostPathRoute);
                }
                return Future.value(false);
              },
              child: Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                  vertical: 1.0,
                ),
                elevation: 0,
                child: SizedBox(
                  height: itemHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        onTap: () {
                          // Navigate to Audio Play Screen
                          context.push(songCarouselHostPathRoute);
                        },
                        title: Dismissible(
                          key: Key(mediaItem.data?.id ?? ""),
                          confirmDismiss: (DismissDirection direction) {
                            if (direction == DismissDirection.startToEnd) {
                              audioHandler.skipToPrevious();
                              // context
                              //     .read<SpotifyMiniPlayerBloc>()
                              //     .add(SwipeToPreviousMiniPlayerEvent());
                            } else {
                              // context
                              //     .read<SpotifyMiniPlayerBloc>()
                              //     .add(SwipeToNextMiniPlayerEvent());
                              audioHandler.skipToNext();
                            }
                            return Future.value(false);
                          },
                          child: Text(
                            mediaItem.data?.title ?? "TrackName",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        subtitle: Text(
                          mediaItem.data?.artist ?? "ArtistName",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: Hero(
                          tag: 'track-cover',
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: const SizedBox.square(
                              dimension: 50.0,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  // mediaItem.data?.artUri.toString() ??
                                  "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        trailing: Stack(
                          children: [
                            snapshot.data?.processingState ==
                                            AudioProcessingState.loading ||
                                        processingState ==
                                            AudioProcessingState.buffering ??
                                    false
                                ? const CircularProgressIndicator()
                                : snapshot.data?.playing ?? false
                                    ? IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          // context
                                          //     .read<
                                          //         SpotifyMiniPlayerBloc>()
                                          //     .add(PlayMiniPlayerEvent());
                                          audioHandler.pause();
                                        },
                                        icon: const Icon(Icons.play_circle_fill,
                                            color: primaryGreenColor),
                                      )
                                    : IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          // context
                                          //     .read<
                                          //         SpotifyMiniPlayerBloc>()
                                          //     .add(
                                          //         PauseMiniPlayerEvent());
                                          audioHandler.play();
                                        },
                                        icon: const Icon(Icons.pause),
                                      )
                          ],
                        ),
                      ),
                      StreamBuilder<Duration>(
                        stream: AudioService.position,
                        builder: (context, snapshot) {
                          final position = snapshot.data;
                          return position == null
                              ? const SizedBox()
                              : SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor:
                                        Theme.of(context).colorScheme.secondary,
                                    inactiveTrackColor: Colors.transparent,
                                    trackHeight: 0.5,
                                    thumbColor:
                                        Theme.of(context).colorScheme.secondary,
                                    thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 1.0,
                                    ),
                                    overlayColor: Colors.transparent,
                                    overlayShape: const RoundSliderOverlayShape(
                                      overlayRadius: 2.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Slider(
                                      inactiveColor: Colors.transparent,
                                      // activeColor: Colors.white,
                                      value: position.inSeconds.toDouble(),
                                      max: mediaItem.data?.duration!.inSeconds
                                              .toDouble() ??
                                          100.00,
                                      onChanged: (newPosition) {
                                        audioHandler.seek(
                                          Duration(
                                            seconds: newPosition.round(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// class MiniPlayer extends StatelessWidget {
//   const MiniPlayer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final itemHeight = MediaQuery.of(context).size.height / 10;
//
//     return BlocBuilder<SpotifyMiniPlayerBloc, SpotifyMiniPlayerEnableState>(
//       builder: (context, state) {
//         return
//             // state.isMiniPlayerIdle
//             //   ? const SizedBox()
//             //   :
//             Dismissible(
//           key: const Key("miniplayer"),
//           direction: DismissDirection.up,
//           confirmDismiss: (DismissDirection dismissDirection) {
//             if (dismissDirection == DismissDirection.up) {
//               // Navigate to Audio Play Screen
//               context.push(songCarouselHostPathRoute);
//             }
//             return Future.value(false);
//           },
//           child: Card(
//             margin: const EdgeInsets.symmetric(
//               horizontal: 2.0,
//               vertical: 1.0,
//             ),
//             elevation: 0,
//             child: SizedBox(
//               height: itemHeight,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       // Navigate to Audio Play Screen
//                       context.push(songCarouselHostPathRoute);
//                     },
//                     title: Dismissible(
//                       key: Key(state.trackTitle),
//                       confirmDismiss: (DismissDirection direction) {
//                         if (direction == DismissDirection.startToEnd) {
//                           context
//                               .read<SpotifyMiniPlayerBloc>()
//                               .add(SwipeToPreviousMiniPlayerEvent());
//                         } else {
//                           context
//                               .read<SpotifyMiniPlayerBloc>()
//                               .add(SwipeToNextMiniPlayerEvent());
//                         }
//                         return Future.value(false);
//                       },
//                       child: Text(
//                         state.trackTitle ?? "TrackName",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     subtitle: Text(
//                       state.trackArtist ?? "ArtistName",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     leading: Hero(
//                       tag: 'track-cover',
//                       child: Card(
//                         elevation: 8,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(7.0),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         child: SizedBox.square(
//                           dimension: 50.0,
//                           child: Image(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                               state.trackCoverUrl ?? "",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     trailing: Stack(
//                       children: [
//                         state.isLoading
//                             ? const CircularProgressIndicator()
//                             : state.isPlaying
//                                 ? IconButton(
//                                     iconSize: 50,
//                                     onPressed: () {
//                                       context
//                                           .read<SpotifyMiniPlayerBloc>()
//                                           .add(PlayMiniPlayerEvent());
//                                     },
//                                     icon: const Icon(Icons.play_circle_fill,
//                                         color: primaryGreenColor),
//                                   )
//                                 : IconButton(
//                                     iconSize: 50,
//                                     onPressed: () {
//                                       context
//                                           .read<SpotifyMiniPlayerBloc>()
//                                           .add(PauseMiniPlayerEvent());
//                                     },
//                                     icon: const Icon(Icons.pause),
//                                   )
//                       ],
//                     ),
//                   ),
//                   SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       activeTrackColor: Theme.of(context).colorScheme.secondary,
//                       inactiveTrackColor: Colors.transparent,
//                       trackHeight: 0.5,
//                       thumbColor: Theme.of(context).colorScheme.secondary,
//                       thumbShape: const RoundSliderThumbShape(
//                         enabledThumbRadius: 1.0,
//                       ),
//                       overlayColor: Colors.transparent,
//                       overlayShape: const RoundSliderOverlayShape(
//                         overlayRadius: 2.0,
//                       ),
//                     ),
//                     child: Center(
//                       child: Slider(
//                         inactiveColor: Colors.transparent,
//                         value: state.currentProgressState.toDouble() ?? 0.0,
//                         max: state.totalProgressValue.toDouble() ?? 100.00,
//                         onChanged: (newPosition) {
//                           // audioHandler.seek(
//                           //   Duration(
//                           //     seconds: newPosition.round(),
//                           //   ),
//                           // );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
