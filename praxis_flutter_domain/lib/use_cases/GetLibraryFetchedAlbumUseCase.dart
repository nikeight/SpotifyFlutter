import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/repositories/LibraryRepository.dart';
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

import '../entities/AlbumDm.dart';

class GetLibraryFetchedAlbumUseCase extends UseCase<List<AlbumDm>, String> {

  final LibraryRepository libraryRepository;

  GetLibraryFetchedAlbumUseCase(this.libraryRepository);

  @override
  Future<Stream<List<AlbumDm>?>> buildUseCaseStream(String? params) async {
    final streamController = StreamController<List<AlbumDm>?>();
    try {
      final multipleAlbumResponse = await libraryRepository.fetchData();
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
