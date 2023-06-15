import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/spotify_search/search/spotify_search_bloc.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/component/SongListItemView.dart';

class SpotifySearchScreen extends StatelessWidget {
  const SpotifySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpotifySearchBloc(),
      child: BlocBuilder<SpotifySearchBloc, SpotifySearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Perform search functionality here
                  context
                      .read<SpotifySearchBloc>()
                      .add(SearchQueryEnteredEvent(value));
                },
              ),
            ),
            body: state is SpotifySearchQueryResultState
                ? Center(
                    child: ListView.builder(
                        itemCount: (state as Success).data.searchItems.length,
                        itemBuilder: (context, index) {
                          var currentItem =
                              (state as Success).data.searchItems[index];
                          return SongListItemView(
                            // imageUrl: currentItem.thumbnailImageUrl,
                            songName: currentItem.trackName,
                            artistName: currentItem.artistName,
                            isPlaying: false,
                            onTap: () {
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
