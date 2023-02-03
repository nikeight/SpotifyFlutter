import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';

class DummyGetCachedAlbumbsUseCase extends UseCase<SongsWithListType, void> {
  final SongsRepository songsRepository;

  DummyGetCachedAlbumbsUseCase(this.songsRepository);

  @override
  Future<Stream<SongsWithListType>> buildUseCaseStream(void params) async {
    final controller = StreamController<SongsWithListType>();
    try {
      var result = 1/0;
      // final responseFromRepo = await songsRepository.getAllCachedFavSongs();
      // print("UseCase Response $responseFromRepo");
      // if (responseFromRepo != null) {
      //   controller.add(responseFromRepo);
      // }
      // controller.add(responseFromRepo);
      // controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
