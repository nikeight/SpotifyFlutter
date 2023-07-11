import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/spotify_chip_button.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';
import 'package:praxis_flutter/features/spotify_library/spotify_library_bloc.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/component/LibraryListItemCard.dart';

class SpotifyLibraryScreen extends StatelessWidget {
  const SpotifyLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpotifyLibraryBloc()..add(FetchInitialDataEvent()),
      child: BlocBuilder<SpotifyLibraryBloc, UiState<SpotifyLibraryState>>(
        builder: (context, state) {
          return state is Initial
              ? const Center(child: CircularProgressIndicator())
              : state is Success
                  ? Scaffold(
                      backgroundColor: spotifyBlack,
                      appBar: AppBar(
                        backgroundColor: spotifyBlack,
                        title: const Text("Your Library"),
                        actions: [
                          IconButton(
                            iconSize: 24,
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // ...
                            },
                          ),
                          IconButton(
                            iconSize: 24,
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ],
                      ),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            color: spotifyDarkGrey,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: rowChips(),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SpotifyText.captionText("Recents"),
                                const Icon(
                                  Icons.recent_actors_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: List.generate(
                                  (state as Success)
                                      .data
                                      .fetchedAlbumList
                                      .length, (index) {
                                var currentAlbum = (state as Success)
                                    .data
                                    .fetchedAlbumList[index];
                                return Expanded(
                                  child: LibraryListItemCard(currentAlbum,(){}),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    )
                  : const Text("Loading Wait");
        },
      ),
    );
  }
}

rowChips() {
  return Row(
    children: <Widget>[
      SpotifyChipButton(
          label: "Playlist", isSelected: true, onChipClicked: () {}),
      SpotifyChipButton(
          label: "Podcasts", isSelected: false, onChipClicked: () {}),
      SpotifyChipButton(
          label: "Artists", isSelected: true, onChipClicked: () {}),
      SpotifyChipButton(
          label: "Downloads", isSelected: false, onChipClicked: () {}),
      SpotifyChipButton(
          label: "Owned", isSelected: false, onChipClicked: () {}),
      SpotifyChipButton(
          label: "Recently Played", isSelected: true, onChipClicked: () {}),
      SpotifyChipButton(
          label: "Shows", isSelected: false, onChipClicked: () {}),
    ],
  );
}
