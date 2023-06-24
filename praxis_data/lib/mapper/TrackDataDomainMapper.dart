import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/ItemDataDomainMapper.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/TrackDataModel.dart';
import 'package:praxis_flutter_domain/entities/ItemDm.dart';
import 'package:praxis_flutter_domain/entities/TrackDm.dart';

@injectable
class TrackDataDomainMapper extends EntityMapper<TrackDm, TrackDataModel> {
  final ItemDataDomainMapper itemDataDomainMapper;

  TrackDataDomainMapper(this.itemDataDomainMapper);

  @override
  TrackDataModel mapToData(model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  TrackDm mapToDomain(TrackDataModel entity) {
    final List<ItemDm>? itemList = entity.items
        ?.map((e) => itemDataDomainMapper.mapToDomain(e)).toList();

    return TrackDm(
      itemList: itemList ?? List.empty(),
      total: entity.total ?? 0,
      href: entity.href ?? "",
    );
  }
}
