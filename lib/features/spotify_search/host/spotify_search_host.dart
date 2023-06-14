import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/features/spotify_search/host/spotify_search_host_cubit.dart';
import 'package:praxis_flutter/models/CategoryUiModel.dart';
import 'package:praxis_flutter/ui/component/spotify_category_item_view.dart';

import '../../../models/ui_state.dart';

class SpotifySearchHostScreen extends StatelessWidget {
  const SpotifySearchHostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifySearchHostCubit, UiState<SpotifySearchHostState>>(
        builder: (context, state) {
      return state is Success
          ? Scaffold(
              appBar: AppBar(
                title: const Text("Search"),
                actions: [
                  IconButton(
                      onPressed: () {
                        // Open Camera and a Scanner
                      },
                      icon: const Icon(Icons.camera_alt_outlined))
                ],
              ),
              body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                color: spotifyBlack,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: "What do you want to listen to?",
                          focusColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => {
                              // Clear Text
                            },
                          ),
                          // Add a search icon or button to the search bar
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Perform the search here
                            },
                          )),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                        ((state as Success).data as SpotifySearchSuccessState)
                            .fetchedCategoryList
                            .length,
                        (index) {
                          var currentCategory = ((state as Success).data
                                  as SpotifySearchSuccessState)
                              .fetchedCategoryList[index];
                          return SpotifyCategoryItemViewComponentWidget(
                              category: currentCategory);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Text("Loading Search Content");
    });
  }
}
