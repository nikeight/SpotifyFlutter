part of 'spotify_search_bloc.dart';

@immutable
abstract class SpotifySearchEvent {}

class SearchQueryEnteredEvent extends SpotifySearchEvent {
  final String query;

  SearchQueryEnteredEvent(this.query);
}
