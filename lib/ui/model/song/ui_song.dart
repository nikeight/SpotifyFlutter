import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_flutter/ui/model/ui_model.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';

class SongUiModel extends UIModel {
  final String songPosterUrl;
  final String songName;
  final String songAuthor;

  SongUiModel({
    required this.songName,
    required this.songAuthor,
    required this.songPosterUrl,
  });
}

@injectable
class UiDomainMapper extends EntityMapper<Song, SongUiModel> {
  @override
  SongUiModel mapToData(Song model) {
    return SongUiModel(
        songPosterUrl: model.songPosterImgUrl,
        songName: model.songName,
        songAuthor: model.songAuthor);
  }

  @override
  Song mapToDomain(SongUiModel entity) {
    return Song(entity.songPosterUrl, entity.songName, entity.songAuthor);
  }
}

class UiSongsList extends UIModel {
  List<SongUiModel> songsList;

  UiSongsList(this.songsList);
}
