import 'package:bloc/bloc.dart';
import 'package:praxis_flutter/models/ui_state.dart';

class SongPlayCubit extends Cubit<UiState<bool>> {
  // final getToggleFavItemUseCase =
  //     GetIt.I.get<InsertRemoveFavAlbumFromDbUseCase>();
  // final uiDomainMapper = GetIt.I.get<UiDomainMapper>();

  SongPlayCubit() : super(Initial()) {
    //
  }

  // void toggleFavAlbum(SongUiModel song) {
    // getToggleFavItemUseCase.perform(_handleToggleFavAlbumEvent, _onErrorCaught,
    //     _onCompleteProcess, uiDomainMapper.mapToDomain(song));
  // }

  _handleToggleFavAlbumEvent(bool? event) {
    if (event == true) {
      print("This is the DB event $event");
      emit(Success(data: true));
    } else {
      emit(Failure(exception: Exception("Insertion failed")));
    }
  }

  _onErrorCaught(e) {
    emit(Failure(exception: Exception(e)));
  }

  _onCompleteProcess() {
    // Emit some state or dispose channel until trigger again.
  }

  @override
  Future<void> close() {
    // getToggleFavItemUseCase.dispose();
    return super.close();
  }
}
