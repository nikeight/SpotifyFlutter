part of 'spotify_search_bloc.dart';

@immutable
abstract class SpotifySearchState {}

class SpotifySearchInitial extends SpotifySearchState {}

class SpotifySearchQueryResultState extends SpotifySearchState{
  final List<SearchItemUiModel> searchQueryItem;

  SpotifySearchQueryResultState(this.searchQueryItem);
}
