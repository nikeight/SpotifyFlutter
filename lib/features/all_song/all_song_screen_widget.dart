import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/spotify_home/component/SearchComponent.dart';
import 'package:praxis_flutter/features/spotify_home/component/grid_song_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class AllSongScreenWidget extends StatelessWidget {
  const AllSongScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllSongCubit, UiState<UiSongsList>>(
        builder: (context, state) {
      return Stack(alignment: Alignment.center, children: [
        state is Loading
            ? const Text("Loading")
            : state is Failure
                ? const Text("Failure")
                : state is Success
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            const SearchComponent(
                              recentSearchedCachedList: [],
                              fetchedSongTitleList: [],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GridSongCardWidget(
                                songList: (state as Success).data.songsList
                            )
                          ],
                        ),
                      )
                    : const Center(
                        child:
                            Text("Debug Container Please Remove or Improve it"),
                      )
      ]);
    });
  }
}
