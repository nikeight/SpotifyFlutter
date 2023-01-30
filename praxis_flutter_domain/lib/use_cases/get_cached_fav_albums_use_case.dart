import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';

import 'get_random_song_list_usecase.dart';

class GetCachedFavAlbumUseCase
    extends UseCase<GetRandomSongListResponse, void> {
  final SongsRepository dataAlbumRepository;

  GetCachedFavAlbumUseCase(this.dataAlbumRepository);

  @override
  Future<Stream<GetRandomSongListResponse?>> buildUseCaseStream(
      void params) async {
    final dataStreamController = StreamController<GetRandomSongListResponse>();
    try {
      final cachedFavAlbumList =
          await dataAlbumRepository.getAllCachedFavSongs();
      dataStreamController
          .add(GetRandomSongListResponse(randomSongList: cachedFavAlbumList));
      dataStreamController.close();
    } catch (e) {
      dataStreamController.addError(e);
      dataStreamController.close();
    }
    return dataStreamController.stream;
  }
}
