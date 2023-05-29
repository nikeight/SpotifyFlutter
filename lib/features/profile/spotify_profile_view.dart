import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: SongListScreen((state as Success).data.recentlyPlayedUiList[0].tracks),
        )
            : const Text("Something Went Wrong");
      },
    );
  }
}
