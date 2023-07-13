import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/spotify_min_player/spotify_mini_player_bloc.dart';
import 'package:praxis_flutter/routing/routes.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height / 10;

    return BlocBuilder<SpotifyMiniPlayerBloc, SpotifyMiniPlayerEnableState>(
      builder: (context, state) {
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
                      key: Key(state.trackTitle),
                      confirmDismiss: (DismissDirection direction) {
                        if (direction == DismissDirection.startToEnd) {
                          context
                              .read<SpotifyMiniPlayerBloc>()
                              .add(SwipeToPreviousMiniPlayerEvent());
                        } else {
                          context
                              .read<SpotifyMiniPlayerBloc>()
                              .add(SwipeToNextMiniPlayerEvent());
                        }
                        return Future.value(false);
                      },
                      child: Text(
                        state.trackTitle ?? "TrackName",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Text(
                      state.trackArtist ?? "ArtistName",
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
                        child: SizedBox.square(
                          dimension: 50.0,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              state.trackCoverUrl ?? "",
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: Stack(
                      children: [
                        state.isPlaying
                            ? IconButton(
                                iconSize: 50,
                                onPressed: () {
                                  context
                                      .read<SpotifyMiniPlayerBloc>()
                                      .add(PlayMiniPlayerEvent());
                                },
                                icon: const Icon(Icons.play_circle_fill,
                                    color: primaryGreenColor),
                              )
                            : IconButton(
                                iconSize: 50,
                                onPressed: () {
                                  context
                                      .read<SpotifyMiniPlayerBloc>()
                                      .add(PauseMiniPlayerEvent());
                                },
                                icon: const Icon(Icons.pause),
                              )
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Theme.of(context).colorScheme.secondary,
                      inactiveTrackColor: Colors.transparent,
                      trackHeight: 0.5,
                      thumbColor: Theme.of(context).colorScheme.secondary,
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
                        value: state.currentProgressState.toDouble() ?? 0.0,
                        max: state.totalProgressValue.toDouble() ?? 100.00,
                        onChanged: (newPosition) {
                          // audioHandler.seek(
                          //   Duration(
                          //     seconds: newPosition.round(),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
