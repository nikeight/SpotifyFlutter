import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/fav_screen/fav_album_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';

import '../../ui/component/SearchComponent.dart';
import '../../ui/component/grid_song_card_widget.dart';

class AllFavSongScreenWidget extends StatelessWidget {
  const AllFavSongScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FavAlbumsCubit>().loadFavAlbums();
    return BlocConsumer<FavAlbumsCubit, UiState<Void>>(
        builder: (context, state) {
          return Container(
            color: const Color(0xffE0DECA),
            child: Stack(alignment: Alignment.center, children: [
              state is Initial
                  ? const Text("No fav albums added yet")
                  : state is Loading
                      ? const PraxisProgressBar()
                      : state is Failure
                          ? Text(
                              "Failure ${(state as Failure).exception.toString()}")
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
                                      // GridSongCardWidget(songList: (state as Success).data.songsList)
                                      GridSongCardWidget(
                                          // songList:
                                          //     (state as Success).data.songsList
                                      )
                                    ],
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                      "Debug Container Please Remove or Improve it"),
                                )
            ]),
          );
        },
        listener: (context, state) {});
  }
}
