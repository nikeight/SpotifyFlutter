
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'ArtistUiMapper.dart';
import 'TracksUIMapper.dart';
import 'UiMapper.dart';

@injectable
class AlbumUiMapper extends UIMapper<AlbumUiModel, AlbumDm> {

  ArtistUiMapper artistUiMapper;
  TracksUiMapper tracksUiMapper;

  AlbumUiMapper(this.artistUiMapper, this.tracksUiMapper);

  @override
  AlbumDm mapToEntity(AlbumUiModel uiModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }

  @override
  AlbumUiModel mapToUiModel(AlbumDm entity) {
    return AlbumUiModel(
        artist: artistUiMapper.mapToUiModel(entity.artist),
        label: entity.label,
        thumbnailImageUrl: entity.thumbnailImageUrl,
        tracks: tracksUiMapper.mapToUiModel(entity.tracks),
        albumId: entity.albumId);
  }
}
