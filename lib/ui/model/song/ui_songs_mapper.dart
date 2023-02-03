import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';

@injectable
class UISongsListMapper extends UiModelMapper<SongsWithListType, UiSongsList> {
  @override
  SongsWithListType mapToDomain(UiSongsList modelItem) {
    return SongsWithListType(
        songList: modelItem.songsList
            .map((e) => Song(e.songPosterUrl, e.songName, e.songAuthor))
            .toList());
  }

  @override
  UiSongsList mapToPresentation(SongsWithListType model) {
    return UiSongsList(model.songList
        .map((domainModel) => SongUiModel(
            songPosterUrl: domainModel.songPosterImgUrl,
            songName: domainModel.songName,
            songAuthor: domainModel.songAuthor))
        .toList());
  }
}
