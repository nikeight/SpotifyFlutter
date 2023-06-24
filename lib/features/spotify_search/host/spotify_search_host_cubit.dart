import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/mapper/CategoryUiMapper.dart';
import 'package:praxis_flutter/models/CategoryUiModel.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter_domain/entities/CategoryDm.dart';
import 'package:praxis_flutter_domain/use_cases/search/GetSpotifyCategoriesUseCase.dart';

part 'spotify_search_host_state.dart';

class SpotifySearchHostCubit extends Cubit<UiState<SpotifySearchHostState>> {

  final getMultipleCategoryUseCase = GetIt.I.get<GetSpotifyCategoriesUseCase>();
  final categoryUiMapper = GetIt.I.get<CategoryUiMapper>();

  SpotifySearchHostCubit() : super(Initial()){
    loadMultipleAlbums();
  }

  void loadMultipleAlbums() {
    getMultipleCategoryUseCase.perform(
        handleMultipleAlbumResponse, error, complete);
  }

  void handleMultipleAlbumResponse(List<CategoryDm>? response) {
    final List<CategoryUiModel> fetchedCategoryList = [];
    if (response != null && response.isNotEmpty) {
      for (var element in response) {
        fetchedCategoryList.add(categoryUiMapper.mapToDomain(element));
      }

      emit(
        Success(
          data: SpotifySearchSuccessState(fetchedCategoryList),
        ),
      );
    } else {
      print("Response is empty");
      emit(Failure(exception: Exception("API Failure")));
    }
  }

  void complete() {}

  error(e) {
    emit(Failure(exception: Exception(e)));
  }
}
