import 'dt_song.dart';

class DtSongList {
  final List<DtSong>? dtSongList;

  DtSongList(this.dtSongList);

  void add(DtSong dtSongObject) {
    dtSongList?.add(dtSongObject);
  }
}
