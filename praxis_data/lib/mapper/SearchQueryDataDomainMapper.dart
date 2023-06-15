import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/SearchQueryAlbumDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/album/SearchQueryItemDataModel.dart';
import 'package:praxis_flutter_domain/entities/SearchItemDm.dart';

@injectable
class SearchQueryDataDomainMapper
    extends EntityMapper<SearchItemDm, SearchQueryItemDataModel> {
  @override
  SearchQueryItemDataModel mapToData(SearchItemDm model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  SearchItemDm mapToDomain(SearchQueryItemDataModel entity) {
    return SearchItemDm(entity.id ?? "", entity.images?.first.url ?? "",
        entity.name ?? "", entity.type ?? "", entity.artists?.first.name ?? "");
  }
}
