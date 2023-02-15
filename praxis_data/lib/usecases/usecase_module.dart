import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart';
import 'package:praxis_flutter_domain/use_cases/get_random_song_list_usecase.dart';
import 'package:praxis_flutter_domain/use_cases/insert_remove_fav_album_from_db_usecase.dart';

@module
abstract class UseCaseModule {
  GetRandomSongListUseCase get getRandomSongListUseCase =>
      GetRandomSongListUseCase(GetIt.instance.get());

  GetCachedFavAlbumUseCase get getCachedFavAlbumUseCase =>
      GetCachedFavAlbumUseCase(GetIt.instance.get());

  InsertRemoveFavAlbumFromDbUseCase get getInsertRemoveFavAlbumFromDbUseCase =>
      InsertRemoveFavAlbumFromDbUseCase(GetIt.instance.get());
}
