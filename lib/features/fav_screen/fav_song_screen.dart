import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/fav_screen/fav_album_cubit.dart';
import 'package:praxis_flutter/features/spotify_home/component/SearchComponent.dart';
import 'package:praxis_flutter/features/spotify_home/component/SongCard.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class FavSongScreen extends StatelessWidget {
  const FavSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavAlbumsCubit(),
      child: BlocListener<FavAlbumsCubit, UiState<UiSongsList>>(
        child: const AllFavSongScreenWidget(),
        listener: (context, state) {},
      ),
    );
  }
}

class AllFavSongScreenWidget extends StatelessWidget {
  const AllFavSongScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavAlbumsCubit, UiState<UiSongsList>>(
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
                  // Text("This is the length ${(state as Success).data.songList.length}"),
                  const SearchComponent(),
                  const SizedBox(
                    height: 8,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
                      return Container(
                        height: 240,
                        width: 180,
                        margin: const EdgeInsets.all(4),
                        child: const SongCard(),
                      );
                    }),
                  )
                ],
              ),
            )
                : const Center(
              child: Text("This is a Container Center Text"),
            )
          ]);
        });
  }
}
