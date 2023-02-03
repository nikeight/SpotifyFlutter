import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';

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
    } catch (e) {
      print("CachedUseCase Error $e");
      dataStreamController.addError(e);
    }
    return dataStreamController.stream;
  }
}
