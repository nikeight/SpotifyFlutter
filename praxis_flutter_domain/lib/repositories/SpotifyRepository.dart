abstract class SpotifyRepository {
  Future<String> getActiveAccessToken();

  Future<String> getCachedAlbumList(List<String> albumIds);

  Future<String> getAlbumTracksList(int albumId);

  Future<String> getTrackDetails(int trackId);

  Future<String> getPlayLists();

  Future<String> getGenres();

  Future<String> searchQuery(String query);
}
