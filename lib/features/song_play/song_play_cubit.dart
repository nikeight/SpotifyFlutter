import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/model/song/ui_song.dart';
import 'package:praxis_flutter_domain/use_cases/insert_remove_fav_album_from_db_usecase.dart';

class SongPlayCubit extends Cubit<UiState<bool>> {
  final getToggleFavItemUseCase =
      GetIt.I.get<InsertRemoveFavAlbumFromDbUseCase>();
  final uiDomainMapper = GetIt.I.get<UiDomainMapper>();

  SongPlayCubit() : super(Initial()) {
    // Do nothing here
  }

  void toggleFavAlbum(SongUiModel song) {
    getToggleFavItemUseCase.perform((event) {
      if (event != null && event == true) {
        emit(Success(data: true));
      } else {
        emit(Failure(exception: Exception("Insertion failed")));
      }
    }, _onErrorCaught, _onCompleteProcess);
  }

  _onErrorCaught(Exception e) {
    emit(Failure(exception: e));
  }

  _onCompleteProcess() {
    // Emit some state or dispose channel until trigger again.
  }

  @override
  Future<void> close() {
    getToggleFavItemUseCase.dispose();
    return super.close();
  }
}
