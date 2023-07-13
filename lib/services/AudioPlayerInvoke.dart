import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ItemUiModel.dart';

class AudioPlayerInvoke {
  final _audioPlayerHandler = GetIt.I.get<AudioHandler>();

  Future<void> initPlayer({
    required List<ItemUiModel> songList,
  }) async {
    final mediaItemList = songList
        .map(
          (e) => MediaItem(
              id: e.itemId,
              title: e.trackName,
              artist: e.artist,
              duration: const Duration(seconds: 30),
              // Extra Parameters takes the source for the Audio File.
              extras: {'url': e.hrefMp3}),
        )
        .toList();

    await _audioPlayerHandler.addQueueItems(mediaItemList);
  }

  Future<void> startPlayer({required int index}) async {
    _audioPlayerHandler.skipToQueueItem(index);
    _audioPlayerHandler.play();
  }
}
