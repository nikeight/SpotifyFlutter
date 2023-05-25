import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

import '../entities/AlbumDm.dart';

class GetMultipleAlbumUseCase extends UseCase<List<AlbumDm>, String> {

  final SpotifyRepository spotifyRepository;

  GetMultipleAlbumUseCase(this.spotifyRepository);

  @override
  Future<Stream<List<AlbumDm>?>> buildUseCaseStream(String? params) async {
    final streamController = StreamController<List<AlbumDm>?>();
    try {
      final multipleAlbumResponse = await spotifyRepository.getCachedAlbumList(List.empty());
      if (multipleAlbumResponse is Success) {
        final multipleAlbums =
            (multipleAlbumResponse as Success).data as List<AlbumDm>;
        if (multipleAlbumResponse != null) {
          streamController.add(multipleAlbums);
        } else {
          streamController.addError(Exception("Null List"));
        }
      }
    } on Exception catch (e, _) {
      streamController.addError(Exception("Exception : $e -> Null Album List"));
    }
    return streamController.stream;
  }
}
