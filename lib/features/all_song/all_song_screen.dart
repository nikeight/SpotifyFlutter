import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/features/all_song/all_song_screen_widget.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class AllSongScreen extends StatelessWidget {
  const AllSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllSongCubit(),
      child: BlocListener<AllSongCubit, UiState<UiSongsList>>(
        child: const AllSongScreenWidget(),
        listener: (context, state) {},
      ),
    );
  }
}
