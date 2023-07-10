import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/mapper/TracksUIMapper.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter/models/ui_state.dart' as api_response;
import 'package:praxis_flutter_domain/entities/TrackDm.dart';
import 'package:praxis_flutter_domain/use_cases/GetTrackListUseCase.dart';

import '../../models/ui_state.dart';

part 'track_list_state.dart';

class TrackListCubit extends Cubit<UiState<TrackListState>> {
  final getTracksUseCase = GetIt.instance.get<GetTrackListUseCase>();
  final trackUIMapper = GetIt.instance.get<TracksUiMapper>();

  TrackListCubit() : super(Initial()) {
    // Load the Tracks here
    loadTrackList("6jk3ucx33D7CLURgcfVFOT");
  }

  void loadTrackList(String tracksId) {
    getTracksUseCase.perform(
        handleMultipleAlbumResponse, error, complete, "string_param");
  }

  void handleMultipleAlbumResponse(TrackDm? response) {
    if (response != null) {
      emit(
        Success(
          data: TrackListState(trackUIMapper.mapToUiModel(response)),
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
