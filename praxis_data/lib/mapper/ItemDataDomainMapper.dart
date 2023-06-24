import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/ItemDataModel.dart';
import 'package:praxis_flutter_domain/entities/ItemDm.dart';

import 'ArtistDataDomainMapper.dart';

@injectable
class ItemDataDomainMapper extends EntityMapper<ItemDm, ItemDataModel> {
  final ArtistDataDomainMapper artistDataDomainMapper;

  ItemDataDomainMapper(this.artistDataDomainMapper);

  @override
  ItemDataModel mapToData(ItemDm model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  ItemDm mapToDomain(ItemDataModel entity) {
    return ItemDm(
      itemId: entity?.id ?? "",
      artist: entity.artists?.first.name ?? "",
      trackName: entity.name ?? "",
      durationInMs: entity.durationMs ?? 0,
      hrefMp3: entity.previewUrl ?? "",
      shareUri: entity.href ?? "",
    );
  }
}
