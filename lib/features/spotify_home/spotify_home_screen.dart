import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/features/all_song/all_song_screen.dart';
import 'package:praxis_flutter/features/all_song/all_song_screen_widget.dart';
import 'package:praxis_flutter/features/fav_screen/all_fav_song_screen_widget.dart';
import 'package:praxis_flutter/features/fav_screen/fav_album_cubit.dart';
import 'package:praxis_flutter/features/fav_screen/fav_song_screen.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class SpotifyHomeScreen extends StatelessWidget {
  const SpotifyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllSongCubit>(
          create: (BuildContext context) => AllSongCubit(),
        ),
        BlocProvider<FavAlbumsCubit>(
          create: (BuildContext context) => FavAlbumsCubit(),
          child: BlocListener<FavAlbumsCubit, UiState<UiSongsList>>(
            listener: (context, state) {
              // state is Initial
              //     ? FavAlbumsCubit().loadFavAlbums()
              //     : const Text("No fav selected yet");
            },
            child: const AllFavSongScreenWidget(),
          ),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "All Songs",
                ),
                Tab(
                  text: "Fav Songs",
                ),
              ],
            ),
            title: const Text('Spotify Clone'),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [AllSongScreenWidget(), AllFavSongScreenWidget()],
          ),
        ),
      ),
    );
  }
}
