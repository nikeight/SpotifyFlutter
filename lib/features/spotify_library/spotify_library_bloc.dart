import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/use_cases/GetLibraryFetchedAlbumUseCase.dart';

import '../../mapper/AlbumUIMapper.dart';

part 'spotify_library_event.dart';

part 'spotify_library_state.dart';

class SpotifyLibraryBloc
    extends Bloc<SpotifyLibraryEvent, UiState<SpotifyLibraryState>> {
  final getMultipleAlbumsUseCase = GetIt.I.get<GetLibraryFetchedAlbumUseCase>();
  final getAlbumUiMapper = GetIt.I.get<AlbumUiMapper>();

  SpotifyLibraryBloc() : super(Initial()) {
    on<FetchInitialDataEvent>(
        (event, emit) => _loadLibraryAlbumList(event, emit));
    on<LoadedAlbumEvent>((event, emit) => _updateUi(event, emit));
  }

  void _loadLibraryAlbumList(
    SpotifyLibraryEvent event,
    Emitter<UiState<SpotifyLibraryState>> emit,
  ) {
    final List<AlbumUiModel> recentlyPlayedList = [];
    getMultipleAlbumsUseCase.perform(
      (List<AlbumDm>? response) {
        if (response != null && response.isNotEmpty) {
          for (var element in response) {
            recentlyPlayedList.add(getAlbumUiMapper.mapToUiModel(element));
          }
          add(LoadedAlbumEvent(recentlyPlayedList));
        } else {
          print("Response is empty");
          emit(Failure(exception: Exception("API Failure")));
        }
      },
      (e) {
        emit(Failure(exception: Exception(e)));
      },
      () {
        // emit(Failure(exception: Exception("Completed : Something Went Wrong")));
      },
    );
  }

  void _updateUi(
      LoadedAlbumEvent event, Emitter<UiState<SpotifyLibraryState>> emit) {
    emit(Success(
        data: SpotifyLibraryFetchedAlbumListState(
      event.albumsList,
    )));
  }
}
