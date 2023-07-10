import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/spotify_min_player/spotify_mini_player_bloc.dart';
import 'package:praxis_flutter/routing/routes.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifyMiniPlayerBloc, SpotifyMiniPlayerEnableState>(
      builder: (context, state) {
        return Dismissible(
          key: const Key("miniplayer"),
          direction: DismissDirection.up,
          confirmDismiss: (DismissDirection dismissDirection) {
            if (dismissDirection == DismissDirection.up) {
              // Navigate to Audio Play Screen
              context.go(songCarouselHostPathRoute);
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
              height: 76.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    dense: true,
                    onTap: () {
                      // Navigate to Audio Play Screen
                      context.go(songCarouselHostPathRoute);
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
                      tag: 'currentArtwork',
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox.square(
                          dimension: 40.0,
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
                        false
                            ? const CircularProgressIndicator()
                            : true
                                ? IconButton(
                                    iconSize: 62,
                                    onPressed: () {
                                      context
                                          .read<SpotifyMiniPlayerBloc>()
                                          .add(PlayMiniPlayerEvent());
                                    },
                                    icon: const Icon(Icons.play_circle_fill),
                                  )
                                : IconButton(
                                    iconSize: 62,
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
                  Center(
                    child: Slider(
                      inactiveColor: Colors.transparent,
                      // activeColor: Colors.white,
                      value: state.currentProgressState.toDouble(),
                      max: state.totalProgressValue.toDouble(),
                      onChanged: (newPosition) {},
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
