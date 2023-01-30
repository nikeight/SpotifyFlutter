import 'dart:ffi';

class DtSongMapFieldsConstants {
  static const String albumName = 'label';
  static const String albumImageUrl = 'label';
}

class SpotifyDbSongsField {
  static const String album_primary_id = "album_primary_id";
  static const String album_name = "album_name";
  static const String album_title = "album_title";
  static const String album_image_url = "album_image_url";
  static const String album_is_fav = "album_is_fav";
}

class DtSong {
  String? albumId = '';
  String? albumImageUrl = '';
  String? albumName = '';
  String? authorName = '';
  bool? isFav = false;

  DtSong(
      this.albumId,
      this.albumName,
      this.authorName, // TODO: ( Title For now) Fix it accordingly
      this.albumImageUrl,
      this.isFav);

  DtSong.fromJson(Map<String, dynamic> map)
      : albumId = map[SpotifyDbSongsField.album_primary_id],
        albumImageUrl = map[SpotifyDbSongsField.album_image_url],
        albumName = map[SpotifyDbSongsField.album_name],
        authorName = map[SpotifyDbSongsField.album_title],
        isFav = map[SpotifyDbSongsField.album_is_fav];

  Map<String, Object?> toJson() => {
        SpotifyDbSongsField.album_primary_id: albumId,
        SpotifyDbSongsField.album_name: albumName,
        SpotifyDbSongsField.album_image_url: albumImageUrl,
        SpotifyDbSongsField.album_title: authorName,
        SpotifyDbSongsField.album_is_fav: isFav,
      };

  static DtSong dtSongFromJson(Map<String, Object?> json) => DtSong(
        json[SpotifyDbSongsField.album_primary_id] as String,
        json[SpotifyDbSongsField.album_name] as String,
        json[SpotifyDbSongsField.album_title] as String,
        json[SpotifyDbSongsField.album_image_url] as String,
        json[SpotifyDbSongsField.album_is_fav] as bool,
      );

  @override
  String toString() {
    return '$albumId, $albumName, $authorName, $albumImageUrl, $isFav';
  }
}
