import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';

import 'get_random_song_list_usecase.dart';

class GetCachedFavAlbumUseCase extends UseCase<SongsWithListType?, void> {
  final SongsRepository dataAlbumRepository;

  GetCachedFavAlbumUseCase(this.dataAlbumRepository);

  @override
  Future<Stream<SongsWithListType?>> buildUseCaseStream(void params) async {
    final dataStreamController = StreamController<SongsWithListType?>();
    try {
      final cachedFavAlbumList =
          await dataAlbumRepository.getAllCachedFavSongs();
      if (cachedFavAlbumList != null) {
        dataStreamController.add(cachedFavAlbumList);
      }
      dataStreamController.close();
    } catch (e) {
      dataStreamController.addError(e);
      dataStreamController.close();
    }
    return dataStreamController.stream;
  }
}
