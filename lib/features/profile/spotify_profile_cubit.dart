import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/mapper/AlbumUIMapper.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';
import 'package:praxis_flutter/models/ui_state.dart' as api_response;
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';

import '../../models/ui_state.dart';

class SpotifyProfileCubit extends Cubit<UiState<SpotifyProfileCubitStates>> {

  final getMultipleAlbumsUseCase = GetIt.I.get<GetMultipleAlbumUseCase>();
  final getAlbumUiMapper = GetIt.I.get<AlbumUiMapper>();

  SpotifyProfileCubit() : super(Initial()) {
    loadMultipleAlbums();
  }

  void loadMultipleAlbums() {
    getMultipleAlbumsUseCase.perform(
        handleMultipleAlbumResponse, error, complete, "empty_param_string");
  }

  void handleMultipleAlbumResponse(List<AlbumDm>? response) {
    final List<AlbumUiModel> recentlyPlayedList = [];
    if (response != null && response.isNotEmpty) {
      response.forEach((element) {
        recentlyPlayedList.add(getAlbumUiMapper.mapToUiModel(element));
      });

      emit(
        Success(
          data: SpotifyProfileCubitStates(
            recentlyPlayedList,
            List.empty(),
            List.empty(),
            "Greetings",
          ),
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

class SpotifyProfileCubitStates {
  List<AlbumUiModel> recentlyPlayedUiList;
  List<AlbumUiModel>? otherRecommendedAlbumFetchedList;
  List<AlbumUiModel>? otherRecommendedPlayListFetchedList;
  String? greetingText = "Hola! 👋";

  SpotifyProfileCubitStates(
      this.recentlyPlayedUiList,
      this.otherRecommendedAlbumFetchedList,
      this.otherRecommendedPlayListFetchedList,
      this.greetingText);
}
