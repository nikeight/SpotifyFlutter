import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/song_detail_widget.dart';
import 'package:praxis_flutter/features/song_play/song_play_cubit.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (_) => SongPlayCubit(),
        child: SongPlayDetailWidget(
            song:
                SongUiModel(songName: '', songAuthor: '', songPosterUrl: '')));
  }
}
