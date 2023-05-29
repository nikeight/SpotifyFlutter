import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/features/song_play/song_detail_screen.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';
import '../../models/ui_state.dart';

class SongPlayScreen extends StatelessWidget {
  final String? passedIndex;

  const SongPlayScreen({Key? key, this.passedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting the Initial Page for the PageView.Builder
    final PageController pageController =
        PageController(initialPage: int.parse(passedIndex ?? "0"));

    return BlocProvider(
      create: (_) => AllSongCubit(),
      child: BlocBuilder<AllSongCubit, UiState<AllSongUiStateDataClass>>(
          builder: (context, state) {
        return Stack(alignment: Alignment.center, children: [
          state is Loading
              ? const PraxisProgressBar()
              : state is Failure
                  ? const Text("Failure")
                  : state is Success
                      ? Padding(
                          padding: const EdgeInsets.all(8),
                          child: Scaffold(
                            appBar: AppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: const Color(0xffE0DECA),
                              title: const Text(
                                "Top Albums 🔝",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.black45),
                              ),
                              centerTitle: true,
                              actions: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.menu),
                                  color: Colors.black54,
                                )
                              ],
                            ),
                            body: PageView.builder(
                              itemCount: (state as Success)
                                  .data
                                  .uiSongsList
                                  .songsList
                                  .length,
                              controller: pageController,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index) {

                              },
                              itemBuilder: (BuildContext context, int index) {
                                return const SongDetailScreen();
                              },
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                              "Debug Container Please Remove or Improve it"),
                        )
        ]);
      }),
    );
  }
}
