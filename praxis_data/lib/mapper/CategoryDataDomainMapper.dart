import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/spotify_data_model/category/CategoryItemDataModel.dart';
import 'package:praxis_flutter_domain/entities/CategoryDm.dart';

@injectable
class CategoryDataDomainMapper
    extends EntityMapper<CategoryDm, CategoryItemDataModel> {
  @override
  CategoryItemDataModel mapToData(CategoryDm model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  CategoryDm mapToDomain(CategoryItemDataModel entity) {
    return CategoryDm(
        entity.id ?? "", entity.name ?? "", entity.icons?.first.url ?? "");
  }
}
