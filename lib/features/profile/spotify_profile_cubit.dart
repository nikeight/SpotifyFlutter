import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart' as api_response;
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';

import '../../models/ui_state.dart';

class SpotifyProfileCubit extends Cubit<UiState<String>> {
  final getMultipleAlbumsUseCase = GetIt.I.get<GetMultipleAlbumUseCase>();

  SpotifyProfileCubit() : super(Initial()) {
    loadMultipleAlbums();
  }

  void loadMultipleAlbums() {
    getMultipleAlbumsUseCase.perform(
        handleMultipleAlbumResponse,
        error,
        complete,
        "empty_param_string"
    );
  }

  void handleMultipleAlbumResponse(List<AlbumDm>? response) {
    if (response != null && response.isNotEmpty) {
      print("Response : $response");
      emit(Success(data: "Success Response"));
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
