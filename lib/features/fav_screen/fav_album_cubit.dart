import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';
import 'package:praxis_flutter/ui/model/song/ui_songs_mapper.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart';

class FavAlbumsCubit extends Cubit<UiState<UiSongsList>> {
  final getFavAlbumsUseCase = GetIt.I.get<GetCachedFavAlbumUseCase>();
  final uiDomainMapper = GetIt.I.get<UISongsListMapper>();

  // Loading data as soon as we init the Cubit
  FavAlbumsCubit() : super(Initial()) {
    emit(Initial());
    loadFavAlbums();
  }

  void loadFavAlbums() {
    emit(Loading());
    getFavAlbumsUseCase.perform(
        handleDatabaseReadOperation, onErrorCaught, onCompleteProcess);
  }

  void handleDatabaseReadOperation(SongsWithListType? cachedFavAlbums) {
    print("Inside HandleDataBaseOp Method $cachedFavAlbums");
    var responseCachedList = cachedFavAlbums?.songList ?? [];
    if (responseCachedList.isEmpty) {
      emit(Initial());
    } else if (responseCachedList.isNotEmpty) {
      emit(Success(
          data: uiDomainMapper.mapToPresentation(
              SongsWithListType(songList: responseCachedList))));
    } else {
      emit(Failure(exception: Exception("No data found")));
    }
  }

  onErrorCaught(e) {
    emit(Failure(exception: Exception(e)));
  }

  onCompleteProcess() {
    print("On Complete called");
  }

  @override
  Future<void> close() async {
    getFavAlbumsUseCase.dispose();
    super.close();
  }

  @override
  void onChange(Change<UiState<UiSongsList>> change) {
    super.onChange(change);
  }
}
