import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/spotify_search/search/spotify_search_bloc.dart';
import 'package:praxis_flutter/ui/component/SongListItemView.dart';

class SpotifySearchScreen extends StatelessWidget {
  const SpotifySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpotifySearchBloc(),
      child: BlocBuilder<SpotifySearchBloc, SpotifySearchState>(
        buildWhen: (previous, current) =>
            previous != current && current is SpotifySearchQueryResultState,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: spotifyBlack,
            appBar: AppBar(
              backgroundColor: spotifyDarkGrey,
              automaticallyImplyLeading: false,
              title: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: 'What do you want to listen to?',
                    hintStyle: const TextStyle(color: Colors.white54),
                    fillColor: spotifyLightGrey,
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Perform the search here
                      },
                    )),
                onChanged: (value) {
                  // Perform search functionality here
                  context.read<SpotifySearchBloc>().add(
                        SearchQueryEnteredEvent(value),
                      );
                },
              ),
              actions: [
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            body: state is SpotifySearchQueryResultState
                ? Center(
                    child: ListView.builder(
                        itemCount: state.searchQueryItem.length,
                        itemBuilder: (context, index) {
                          var currentItem = state.searchQueryItem[index];
                          // Change to Different Item View for Search Purpose.
                          return SongListItemView(
                            // imageUrl: currentItem.thumbnailImageUrl,
                            songName: currentItem.trackName,
                            artistName: currentItem.artistName,
                            isPlaying: false,
                            onTap: () {
                              // Invoke the Mini Player Event,
                              // Mini-Player will open the Song Carousel
                              // Navigate to the Song Carousel Host Screen
                              // context.goNamed(songCarouselHostPathRouteName,
                              //     extra: (state as Success).data.tracks);
                            },
                          );
                        }),
                  )
                : state is SpotifySearchInitial
                    ? const Center(child: CircularProgressIndicator())
                    : const Text("Wait for it"),
          );
        },
      ),
    );
  }
}
