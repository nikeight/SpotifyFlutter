part of 'spotify_library_bloc.dart';

@immutable
abstract class SpotifyLibraryState {}

class SpotifyLibraryInitial extends SpotifyLibraryState {}

class SpotifyLibraryFetchedAlbumListState extends SpotifyLibraryState {
  final List<AlbumUiModel> fetchedAlbumList;

  SpotifyLibraryFetchedAlbumListState(this.fetchedAlbumList);
}
