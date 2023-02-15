import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/spotify_home/component/SearchComponent.dart';
import 'package:praxis_flutter/features/spotify_home/component/grid_song_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';

class AllSongScreenWidget extends StatelessWidget {
  const AllSongScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllSongCubit, UiState<AllSongUiStateDataClass>>(
        builder: (context, state) {
          print("AllSongCubit Build method called");
          return Stack(alignment: Alignment.center, children: [
        state is Loading
            ? const PraxisProgressBar()
            : state is Failure
                ? const Text("Failure")
                : state is Success
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                              SearchComponent(
                              recentSearchedCachedList: (state as Success).data.recentSearchedAlbumList,
                              fetchedSongTitleList: (state as Success).data.allTopAlbumList,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GridSongCardWidget(
                                songList: (state as Success).data.uiSongsList.songsList
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
