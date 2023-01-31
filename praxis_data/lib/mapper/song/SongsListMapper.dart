import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/song/model/dt_song.dart';
import 'package:praxis_data/models/song/model/dt_song_list.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';

@injectable
class SongsListMapper extends EntityMapper<SongsWithListType, DtSongList> {
  final DataSongModelMapper dataDomainMapper;

  SongsListMapper(this.dataDomainMapper);

  @override
  DtSongList mapToData(SongsWithListType model) {
    return DtSongList(
        model.songList.map((e) => dataDomainMapper.mapToData(e)).toList());
  }

  @override
  SongsWithListType mapToDomain(DtSongList entity) {
    return SongsWithListType(
        songList: entity.dtSongList
                ?.map((e) => dataDomainMapper.mapToDomain(e))
                .toList() ??
            <Song>[]);
  }
}

@injectable
class DataSongModelMapper extends EntityMapper<Song, DtSong> {
  @override
  DtSong mapToData(Song model) {
    return DtSong(
        "", model.songName, model.songAuthor, model.songPosterImgUrl, false);
  }

  @override
  Song mapToDomain(DtSong entity) {
    return Song(entity.albumImageUrl ?? '', entity.authorName ?? '',
        entity.albumName ?? '');
  }
}
