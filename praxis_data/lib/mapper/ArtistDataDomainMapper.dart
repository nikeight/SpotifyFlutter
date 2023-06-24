import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/ArtistDataModel.dart';
import 'package:praxis_flutter_domain/entities/ArtistDm.dart';

@injectable
class ArtistDataDomainMapper extends EntityMapper<ArtistDm, ArtistDataModel> {

  @override
  ArtistDataModel mapToData(ArtistDm model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  ArtistDm mapToDomain(ArtistDataModel entity) {
    return ArtistDm(
        artistName: entity.name ?? "",
        artistId: entity.id ?? "",
        artistUri: entity.uri ?? "",
        artistHref: entity.href ?? "",
    );
  }
}