import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/mapper/UiMapper.dart';
import 'package:praxis_flutter/models/ArtistUiModel.dart';
import 'package:praxis_flutter_domain/entities/ArtistDm.dart';

@injectable
class ArtistUiMapper extends UIMapper<ArtistUiModel,ArtistDm>{

  @override
  ArtistDm mapToEntity(ArtistUiModel uiModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }

  @override
  ArtistUiModel mapToUiModel(ArtistDm entity) {
    return ArtistUiModel(
        artistName: entity.artistName,
        artistId: entity.artistId,
        artistUri: entity.artistUri,
        artistHref: entity.artistHref
    );
  }

}