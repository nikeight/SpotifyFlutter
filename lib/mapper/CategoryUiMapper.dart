import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_flutter/models/CategoryUiModel.dart';
import 'package:praxis_flutter_domain/entities/CategoryDm.dart';

@injectable
class CategoryUiMapper extends EntityMapper<CategoryUiModel, CategoryDm> {
  @override
  CategoryDm mapToData(CategoryUiModel model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  CategoryUiModel mapToDomain(CategoryDm entity) {
    return CategoryUiModel(
        entity.id, entity.categoryName, entity.categoryImgUrl);
  }
}
