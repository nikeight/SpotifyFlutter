import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';
import 'package:praxis_flutter/design_system/spotify_text_input.dart';
import 'package:praxis_flutter/features/song_list/track_list_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/routing/routes.dart';
import 'package:praxis_flutter/ui/component/SongListItemView.dart';

class SongListScreen extends StatelessWidget {
  final String? trackId;
  final ScrollController _scrollController = ScrollController();

  SongListScreen({required this.trackId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width * 0.45;
    final expandedHeight = MediaQuery.of(context).size.height * 0.5;

    return BlocProvider(
      create: (_) => TrackListCubit(),
      child: BlocBuilder<TrackListCubit, UiState<TrackListState>>(
        builder: (context, state) {
          return state is Success
              ? Column(
                  children: [
                    Expanded(
                      child: Scaffold(
                        backgroundColor: spotifyBlack,
                        body: CustomScrollView(
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          slivers: <Widget>[
                            AnimatedBuilder(
                              animation: _scrollController,
                              child: FlexibleSpaceBar(
                                  background: SizedBox(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // List Image/**/
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 32),
                                        child: Image.network(
                                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
                                          width: imageSize,
                                          height: imageSize,
                                        ),
                                      ),

                                      // Para Details
                                      SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SpotifyText.headingThree(
                                                  "Lofi-Coding"),
                                              const SizedBox(height: 4),
                                              SpotifyText.captionText(
                                                  "A Selection of Mellow beats and smooth melodies to enhance your coding experience,with music curated by the Jetbrains."),
                                              const SizedBox(height: 4),
                                              SpotifyText.subHeading(
                                                  "JetBrains"),
                                              const SizedBox(height: 4),
                                              SpotifyText.captionText(
                                                  "2,096 saves, 6h 23m"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                            Icons.download,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons
                                                                  .shuffle_sharp,
                                                              color:
                                                                  Colors.white,
                                                              size: 40,
                                                            )),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                              Icons
                                                                  .play_circle_fill,
                                                              color:
                                                                  Colors.white,
                                                              size: 40),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              builder: (context, child) {
                                return SliverAppBar(
                                  elevation: 0,
                                  stretch: true,
                                  pinned: true,
                                  centerTitle: true,
                                  // floating: true,
                                  title:
                                      _scrollController.offset.roundToDouble() >
                                              expandedHeight - 80
                                          ? const Text("Lofi-Coding")
                                          : const Text(""),
                                  backgroundColor: spotifyWhiteGrey,
                                  actions: [
                                    _scrollController.offset.roundToDouble() >
                                            expandedHeight - 80
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.play_circle_fill,
                                                color: Colors.green,
                                                size: 40,
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                  expandedHeight: expandedHeight,
                                  flexibleSpace: child,
                                  automaticallyImplyLeading: true,
                                );
                              },
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  var currentItem = (state as Success)
                                      .data
                                      .tracks
                                      .itemList[index];
                                  return SongListItemView(
                                    artistName: currentItem.artist.toString(),
                                    isPlaying: false,
                                    onTap: () {
                                      // Navigate to the Song Carousel Host Screen
                                      context.push(songCarouselHostPathRoute,
                                          extra:
                                              (state as Success).data.tracks);
                                    },
                                  );
                                },
                                childCount: (state as Success)
                                    .data
                                    .tracks
                                    .itemList
                                    .length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
