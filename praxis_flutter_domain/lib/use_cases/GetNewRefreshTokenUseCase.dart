import 'dart:async';
import 'dart:ffi';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

class GetNewRefreshTokenUseCase extends UseCase<String?, Void> {

  final SpotifyRepository spotifyRepository;

  GetNewRefreshTokenUseCase(this.spotifyRepository);

  @override
  Future<Stream<String?>> buildUseCaseStream(Void? params) async {
    final streamController = StreamController<String?>();
    try {
      final newAccessTokenResponse = await spotifyRepository.getActiveAccessToken();
      if (newAccessTokenResponse is Success) {
        final newAccessToken =
            (newAccessTokenResponse as Success).data as String;
        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          streamController.add(newAccessToken);
        } else {
          streamController.addError(Exception("Null String Token"));
        }
      }
    } on Exception catch (e, _) {
      streamController
          .addError(Exception("Exception : $e -> Null String Token"));
    }
    return streamController.stream;
  }
}
