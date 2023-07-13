import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/ItemUiModel.dart';

part 'spotify_carousel_host_state.dart';

class SpotifyCarouselHostCubit extends Cubit<SpotifyCarouselHostState> {
  SpotifyCarouselHostCubit() : super(SpotifyCarouselHostState.loading()) {
    emit(SpotifyCarouselHostState.loading());
    _loadPlaylistData();
    _getCurrentIndex();
  }

  final _audioHandler = GetIt.I.get<AudioHandler>();

  List<ItemUiModel> itemModelList = <ItemUiModel>[];

  Future<void> _loadPlaylistData() async {
    _audioHandler.queue.listen(
      (playlist) {
        if (playlist.isEmpty) return;
        itemModelList = playlist
            .map((item) => ItemUiModel(
                itemId: item.id,
                artist: item.artist ?? "Artist",
                trackName: item.title ?? "TrackName",
                durationInMs: item.duration?.inSeconds ?? 0,
                hrefMp3: item.extras?['urls'] ?? "",
                shareUri: item.genre ?? ""))
            .toList();
        emit(SpotifyCarouselHostState(itemModelList, state.currentIndex));
      },
    );
  }

  Future<void> _getCurrentIndex() async {
    _audioHandler.playbackState.listen((value) {
      final currentPlayingIndex = value.queueIndex ?? 0;
      emit(SpotifyCarouselHostState(state.trackItemList, currentPlayingIndex));
    });
  }
}
