import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/features/spotify_home/component/SearchComponent.dart';
import 'package:praxis_flutter/features/spotify_home/component/SongCard.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';

class AllSongScreen extends StatelessWidget {
  const AllSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Calling Build method");
    return BlocProvider(
      create: (_) => AllSongCubit(),
      child: BlocListener<AllSongCubit, UiState<UiSongsList>>(
        child: const AllSongScreenWidget(),
        listener: (context, state) {
          print("$context $state");
          state is Loading ? const Text("Something here") : Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}

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
