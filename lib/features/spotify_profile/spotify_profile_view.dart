import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/component/HorizontalAlbumList.dart';
import 'package:praxis_flutter/ui/component/RecentlyPlayedHorizontalCardWidget.dart';
import 'spotify_profile_cubit.dart';

// Todo : Move Heading and Horizontal List to One Component
/// Rendering of this Screen is causing Performance Issue, needed to Refactor lots of UI Stuff

class SpotifyProfileScreen extends StatelessWidget {
  const SpotifyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifyProfileCubit, UiState<SpotifyProfileCubitStates>>(
      builder: (context, state) {
        return state is Success
            ? Scaffold(
                backgroundColor: spotifyBlack,
                appBar: AppBar(
                  backgroundColor: spotifyBlack,
                  title: Text(
                      (state as Success).data.greetingText ?? "NULL TITLE"),
                  actions: [
                    IconButton(
                      iconSize: 24,
                      icon: const Icon(Icons.notification_add),
                      onPressed: () {
                        // ...
                      },
                    ),
                    IconButton(
                      iconSize: 24,
                      icon: const Icon(Icons.av_timer_sharp),
                      onPressed: () {
                        // ...
                      },
                    ),
                    IconButton(
                      iconSize: 24,
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        // ...
                      },
                    )
                  ],
                ),
                body: ListView(
                  children: [
                    RecentlyPlayedHorizontalCardWidget(
                        recentlyPlayedAlbums:
                            (state as Success).data.recentlyPlayedUiList),
                    const SizedBox(height: 16),
                    SpotifyText.subHeading("Hand Picked Songs"),
                    const SizedBox(height: 8),
                    HorizontalAlbumList(
                      albumName: "Hand Picked",
                      albumList: (state as Success).data.recentlyPlayedUiList,
                    ),
                    const SizedBox(height: 16),
                    SpotifyText.subHeading("Hand Picked Songs"),
                    const SizedBox(height: 8),
                    HorizontalAlbumList(
                      albumName: "Hand Picked",
                      albumList: (state as Success).data.recentlyPlayedUiList,
                    ),
                    const SizedBox(height: 16),
                    SpotifyText.subHeading("Hand Picked Songs"),
                    const SizedBox(height: 8),
                    HorizontalAlbumList(
                      albumName: "Hand Picked",
                      albumList: (state as Success).data.recentlyPlayedUiList,
                    ),
                    const SizedBox(height: 16),
                    SpotifyText.subHeading("Hand Picked Songs"),
                    const SizedBox(height: 8),
                    HorizontalAlbumList(
                      albumName: "Hand Picked",
                      albumList: (state as Success).data.recentlyPlayedUiList,
                    ),
                  ],
                ),
              )
            : const Text("Something Went Wrong");
      },
    );
  }
}
