import 'package:injectable/injectable.dart';
import 'package:praxis_flutter/mapper/UiMapper.dart';
import 'package:praxis_flutter/models/ItemUiModel.dart';
import 'package:praxis_flutter_domain/entities/ItemDm.dart';

@injectable
class ItemUiMapper extends UIMapper<ItemUiModel, ItemDm> {
  @override
  ItemDm mapToEntity(ItemUiModel uiModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }

  @override
  ItemUiModel mapToUiModel(ItemDm entity) {
    return ItemUiModel(
        itemId: entity.itemId,
        artist: entity.artist,
        durationInMs: entity.durationInMs,
        hrefMp3: entity.hrefMp3,
        thumbnailUrl: entity.thumbnailUrl,
        shareUri: entity.shareUri
    );
  }
}
