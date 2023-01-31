import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart';
import 'package:praxis_flutter_domain/use_cases/insert_remove_fav_album_from_db_usecase.dart';

class FavAlbumsCubit extends Cubit<UiState<UiSongsList>> {
  // Injecting Classes using GetIt
  final getFavAlbumsUseCase = GetIt.I.get<GetCachedFavAlbumUseCase>();
  final getToggleFavItemUseCase = GetIt.I.get<
      InsertRemoveFavAlbumFromDbUseCase>();
  final uiDomainMapper = GetIt.I.get<UiModelMapper>();

  // Loading data as soon sa we init the Cubit
  FavAlbumsCubit() : super(Initial()) {
    loadFavAlbums();
  }

  void loadFavAlbums() {
    emit(Loading());
    getFavAlbumsUseCase.perform(
        _handleDatabaseReadOperation, _onErrorCaught, _onCompleteProcess);
  }

  // Todo : Do We have to create separate cubit
  // For Different Action/Events and Different return type (in this case boolean)
  void toggleFavAlbum(SongUiModel song) {
    getToggleFavItemUseCase.perform((event) {
      if (event == true) {
        // emit(Success(data: true));
      } else {
        // emit(Failure(exception: ));
      }
    }, onError, () {});
  }

  void _handleDatabaseReadOperation(SongsWithListType? cachedFavAlbums) {
    if (cachedFavAlbums != null) {
      emit(Success(
          data: uiDomainMapper.mapToPresentation(cachedFavAlbums.songList)));
    } else {
      emit(Failure(exception: Exception("No data found")));
    }
  }

  _onErrorCaught(Exception e) {
    emit(Failure(exception: e));
  }

  _onCompleteProcess() {
    // Emit some state or dispose channel until trigger again.
  }

  @override
  Future<void> close() async {
    getFavAlbumsUseCase.dispose();
    super.close();
  }
}
