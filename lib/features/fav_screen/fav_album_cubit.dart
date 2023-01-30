import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';
import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart'
    as api_response;

class FavAlbumsCubit extends Cubit<UiState<UiSongsList>> {
  final getFavAlbumsUseCase = GetIt.I.get<GetCachedFavAlbumUseCase>();
  final uiDomainMapper = GetIt.I.get<UiModelMapper>();

  FavAlbumsCubit() : super(Initial()) {
    loadFavAlbums();
  }

  void loadFavAlbums() {
    emit(Loading());
    getFavAlbumsUseCase.perform((response) {
      final domainFavAlbums = response?.randomSongList;
      if (domainFavAlbums == null) {
        print("Failure Here");
        emit(Failure(exception: Exception("Couldn't fetch Fav Albums!")));
      } else {
        if (domainFavAlbums is api_response.Failure) {
          emit(Failure(
              exception: (domainFavAlbums as api_response.Failure).error));
        } else if (domainFavAlbums is api_response.Success) {
          var albums = (domainFavAlbums as api_response.Success);
          final uiAlbums = uiDomainMapper.mapToPresentation(albums.data);
          print("Success Here");
          emit(Success(data: uiAlbums));
        }
      }
    }, () {
      emit(Failure(exception: Exception("Something Went wrong")));
    }, () {
      // OnComplete Method
    });
  }

  @override
  Future<void> close() async {
    getFavAlbumsUseCase.dispose();
    super.close();
  }
}
