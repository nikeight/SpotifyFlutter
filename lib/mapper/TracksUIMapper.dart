import 'package:injectable/injectable.dart';
import 'ItemUiMapper.dart';
import 'package:praxis_flutter/mapper/UiMapper.dart';
import 'package:praxis_flutter/models/ItemUiModel.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter_domain/entities/TrackDm.dart';

@injectable
class TracksUiMapper extends UIMapper<TrackUiModel, TrackDm> {

  ItemUiMapper itemUiMapper;

  TracksUiMapper(this.itemUiMapper);

  @override
  TrackDm mapToEntity(TrackUiModel uiModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }

  @override
  TrackUiModel mapToUiModel(TrackDm entity) {
    final List<ItemUiModel> itemUIModelList = [];

    entity.itemList.forEach((element) {
      itemUIModelList.add(itemUiMapper.mapToUiModel(element));
    });

    return TrackUiModel(
        itemList: itemUIModelList, total: entity.total, href: entity.href);
  }
}
