import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_flutter/mapper/UiMapper.dart';
import 'package:praxis_flutter/models/SearchItemUiModel.dart';
import 'package:praxis_flutter_domain/entities/SearchItemDm.dart';

@injectable
class SearchItemUiMapper extends UIMapper<SearchItemUiModel, SearchItemDm> {
  @override
  SearchItemDm mapToEntity(SearchItemUiModel uiModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }

  @override
  SearchItemUiModel mapToUiModel(SearchItemDm entity) {
    return SearchItemUiModel(entity.id, entity.thumbnailImageUrl,
        entity.trackName, entity.type, entity.artistName);
  }
}
