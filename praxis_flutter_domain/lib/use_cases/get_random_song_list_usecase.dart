import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';

class GetRandomSongListUseCase
    extends UseCase<GetRandomSongListResponse, void> {

  // Declare the Repo
  final SongsRepository songsRepository;

  // Init the Repo
  GetRandomSongListUseCase(this.songsRepository);

  @override
  Future<Stream<GetRandomSongListResponse>> buildUseCaseStream(
      void params) async {
    final  controller = StreamController<GetRandomSongListResponse>();
    try {
      final songList = await songsRepository.getRandomSongList();
      controller.add(GetRandomSongListResponse(randomSongList: songList));
      print("Success API Call");
      logger.finest('Successful API Call done');
      controller.close();
    } catch (e) {
      print("Failure API Call $e");
      logger.finest('Failed API Call');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetRandomSongListResponse {
  final ApiResponse<SongsWithListType> randomSongList;

  GetRandomSongListResponse({required this.randomSongList});
}
