import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';

/**
 * This Use-case deals with the Toggle of Fav Album
 * Logic : Add to the database at every option Nevertheless
 * But database handle the case by replacing the item if it has any new values.
 */
class InsertRemoveFavAlbumFromDbUseCase extends UseCase<bool, Song> {
  final SongsRepository songsRepository;

  InsertRemoveFavAlbumFromDbUseCase(this.songsRepository);

  @override
  Future<Stream<bool?>> buildUseCaseStream(Song? song) async {
    final controller = StreamController<bool>();
    try {
      final isItemAddedToDb = await songsRepository.toggleFavAlbumAtDb(song!);
      controller.add(isItemAddedToDb);
      controller.close();
    } catch (e) {
      controller.addError(e);
      controller.close();
    }
    return controller.stream;
  }
}
