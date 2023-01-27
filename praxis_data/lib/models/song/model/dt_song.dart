class DtSongMapFieldsConstants {
  static const String albumName = 'label';
  static const String albumImageUrl = 'label';
}

class DtSong {
  String? albumImageUrl = '';
  String? albumName = '';
  String? authorName = '';

  DtSong(this.albumName, this.albumImageUrl, this.authorName);
}
