import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/fav_screen/all_fav_song_screen_widget.dart';
import 'package:praxis_flutter/features/fav_screen/fav_album_cubit.dart';

class FavSongScreen extends StatelessWidget {
  const FavSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavAlbumsCubit(),
      child: const AllFavSongScreenWidget(),
    );
  }
}