abstract class UIMapper<UI,Domain>{
  UI mapToUiModel(Domain entity);
  Domain mapToEntity(UI uiModel);
}