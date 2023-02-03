import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';
import 'package:praxis_flutter_domain/use_cases/get_random_song_list_usecase.dart';
import '../../ui/model/song/ui_songs_mapper.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart'
    as api_response;

class AllSongCubit extends Cubit<UiState<AllSongUiStateDataClass>> {
  final getTopRandomAlbumsUseCase = GetIt.I.get<GetRandomSongListUseCase>();
  final domainMapper = GetIt.I.get<UISongsListMapper>();

  List<String> topAlbumList = [];
  List<String> recentSearchedItemList = [];

  AllSongCubit() : super(Initial()) {
    loadAlbums();
  }

  List<String> getTopAlbumList() {
    return topAlbumList;
  }

  List<String> getRecentSearchedList() {
    topAlbumList.take(5).forEach((element) {
      recentSearchedItemList.add(element);
    });
    return recentSearchedItemList;
  }

  void loadAlbums() {
    emit(Loading());
    getTopRandomAlbumsUseCase.perform(handleResponse, error, complete);
  }

  void handleResponse(GetRandomSongListResponse? response) {
    final useCaseResponseAlbums = response?.randomSongList;
    if (useCaseResponseAlbums == null) {
      emit(Failure(exception: Exception("Couldn't fetch Albums!")));
    } else {
      if (useCaseResponseAlbums is api_response.Failure) {
        emit(Failure(
            exception: (useCaseResponseAlbums as api_response.Failure).error));
      } else if (useCaseResponseAlbums is api_response.Success) {
        var albums = (useCaseResponseAlbums as api_response.Success);
        final uiAlbums = domainMapper.mapToPresentation(albums.data);
        uiAlbums.songsList.forEach((songUiModel) {
          topAlbumList.add(songUiModel.songName);
        });
        emit(Success(
            data: AllSongUiStateDataClass(
                uiAlbums, getTopAlbumList(), getRecentSearchedList())));
      }
    }
  }

  void complete() {}

  error(e) {
    emit(Failure(exception: e));
  }

  @override
  Future<void> close() {
    getTopRandomAlbumsUseCase.dispose();
    return super.close();
  }
}

class AllSongUiStateDataClass {
  UiSongsList uiSongsList;
  List<String> allTopAlbumList;
  List<String> recentSearchedAlbumList;

  AllSongUiStateDataClass(
      this.uiSongsList, this.allTopAlbumList, this.recentSearchedAlbumList);
}
