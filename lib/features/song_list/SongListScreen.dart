import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';
import 'package:praxis_flutter/features/song_list/track_list_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter/ui/component/SongListItemView.dart';

class SongListScreen extends StatelessWidget {
  final String? trackId;

  const SongListScreen({required this.trackId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 2;

    return BlocProvider(
      create: (_) => TrackListCubit(),
      child: BlocBuilder<TrackListCubit, UiState<TrackListState>>(
        builder: (context, state) {
          return state is Success
              ? Scaffold(
                  backgroundColor: spotifyBlack,
                  body: CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        expandedHeight: 100,
                        flexibleSpace: SliverAppBar(
                          title: Text("Lofi-Coding"),
                        ),
                        // flexibleSpace: Flexible(
                        //     child: Column(children: [
                        //   // List Image
                        //   Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 32, horizontal: 64),
                        //     child: Image.network(
                        //       "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
                        //       width: imageSize - 32,
                        //       height: imageSize - 32,
                        //     ),
                        //   ),
                        //
                        //   // Para Details
                        //   SizedBox(
                        //     height: 150,
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         SpotifyText.headline("Lofi-Coding"),
                        //         SpotifyText.captionText(
                        //             "A Selection of Mellow beats and smooth melodies to enhance your coding experience,with music curated by the Jetbrains."),
                        //         SpotifyText.captionText("JetBrains"),
                        //         SpotifyText.captionText("2,096 saves, 6h 23m"),
                        //       ],
                        //     ),
                        //   ),
                        //
                        //   // Icons Row, not Rendering: FIX IT 🚧
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     crossAxisAlignment: CrossAxisAlignment.stretch,
                        //     children: [
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: const Icon(
                        //             Icons.add,
                        //             color: primaryGreenColor,
                        //           )),
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: const Icon(Icons.download)),
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: const Icon(Icons.shuffle_sharp)),
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: const Icon(Icons.play_circle_fill)),
                        //     ],
                        //   )
                        // ])),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            var currentItem =
                                (state as Success).data.tracks.itemList[index];
                            return SongListItemView(
                              artistName: currentItem.artist.toString(),
                              isPlaying: false,
                              onTap: () {
                                // Navigate to the Song Carousel Host Screen
                                context.push(songCarouselHostPathRoute,
                                    extra: (state as Success).data.tracks);
                              },
                            );
                          },
                          childCount:
                              (state as Success).data.tracks.itemList.length,
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text(
                    "Failure",
                    style: TextStyle(color: Colors.white),
                  ),
                );
        },
      ),
    );
  }
}

Widget itemListBuilder(state) => ListView.builder(
      itemCount: (state as Success).data.tracks.itemList.length,
      itemBuilder: (context, index) {
        var currentItem = (state as Success).data.tracks.itemList[index];
        return SongListItemView(
// imageUrl: currentItem.thumbnailUrl,
// songName: currentItem.durationInMs.toString(),
          artistName: currentItem.artist.toString(),
          isPlaying: false,
          onTap: () {
// Navigate to the Song Carousel Host Screen
            context.push(songCarouselHostPathRoute,
                extra: (state as Success).data.tracks);
          },
        );
      },
    );
