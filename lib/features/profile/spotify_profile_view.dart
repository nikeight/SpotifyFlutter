import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/profile/spotify_profile_cubit.dart';
import 'package:praxis_flutter/ui/component/HorizontalAlbumList.dart';
import 'package:praxis_flutter/ui/component/RecentlyPlayedHorizontalCardWidget.dart';
import '../../models/ui_state.dart';
import '../song_list/SongListScreen.dart';

class SpotifyProfileScreen extends StatelessWidget {
  const SpotifyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifyProfileCubit, UiState<SpotifyProfileCubitStates>>(
      builder: (context, state) {
        return state is Success
            ? Scaffold(
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
                body: Container(
                  color: spotifyBlack,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecentlyPlayedHorizontalCardWidget(
                          recentlyPlayedAlbums:
                              (state as Success).data.recentlyPlayedUiList),
                      const SizedBox(height: 16),
                      const Text(
                        "Hand Picked Albums",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: HorizontalAlbumList(
                            albumName: "Hand Picked",
                            albumList:
                                (state as Success).data.recentlyPlayedUiList),
                      ),
                    ],
                  ),
                ),
              )
            : const Text("Something Went Wrong");
      },
    );
  }
}
