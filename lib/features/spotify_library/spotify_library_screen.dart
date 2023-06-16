import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
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
              ? const CircularProgressIndicator()
              : state is Success
                  ? Scaffold(
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
                            color: spotifyBlack,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("Chip One"),
                                Text("Chip Two"),
                                Text("Chip Three"),
                                Text("Chip Four")
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            color: spotifyBlack,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Chip One"),
                                Icon(Icons.recent_actors_outlined)
                              ],
                            ),
                          ),
                          Expanded(
                              child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: List.generate(
                                (state as Success).data.fetchedAlbumList.length,
                                (index) {
                              var currentAlbum = (state as Success)
                                  .data
                                  .fetchedAlbumList[index];
                              return Expanded(
                                child: LibraryListItemCard(currentAlbum),
                              );
                            }),
                          ))
                        ],
                      ),
                    )
                  : const Text("Loading Wait");
        },
      ),
    );
  }
}
