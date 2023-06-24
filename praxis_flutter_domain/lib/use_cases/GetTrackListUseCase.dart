import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/TrackDm.dart';
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart';

import '../utils/api_response.dart';

class GetTrackListUseCase extends UseCase<TrackDm, String> {
  final SpotifyRepository spotifyRepository;

  GetTrackListUseCase(this.spotifyRepository);

  @override
  Future<Stream<TrackDm?>> buildUseCaseStream(String? params) async {
    final streamController = StreamController<TrackDm?>();
    try {
      final tracksResponse =
          await spotifyRepository.getAlbumTracksList("6jk3ucx33D7CLURgcfVFOT" ?? "");
      if (tracksResponse is Success) {
        final multipleAlbums = (tracksResponse as Success).data as TrackDm;
        if (tracksResponse != null) {
          streamController.add(multipleAlbums);
        } else {
          // Todo : Return specific Error Exceptions messages.
          streamController.addError(Exception("Null List"));
        }
      }
    } on Exception catch (e, _) {
      streamController.addError(Exception("Exception : $e -> Null Album List"));
    }
    return streamController.stream;
  }
}
