part of 'spotify_search_host_cubit.dart';

abstract class SpotifySearchHostState extends Equatable {
  const SpotifySearchHostState();
}

class SpotifySearchHostInitial extends SpotifySearchHostState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SpotifySearchSuccessState extends SpotifySearchHostState {

  List<CategoryUiModel> fetchedCategoryList;

  SpotifySearchSuccessState(this.fetchedCategoryList);

  @override
  List<Object> get props => [fetchedCategoryList];
}
