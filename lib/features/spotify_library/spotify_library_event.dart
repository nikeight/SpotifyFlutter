part of 'spotify_library_bloc.dart';

@immutable
abstract class SpotifyLibraryEvent {}

class FetchInitialDataEvent extends SpotifyLibraryEvent {}

class LoadedAlbumEvent extends SpotifyLibraryEvent {
  final List<AlbumUiModel> albumsList;

  LoadedAlbumEvent(this.albumsList);
}
