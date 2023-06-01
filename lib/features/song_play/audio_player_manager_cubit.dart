import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/models/AlbumUiModel.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';

import '../../mapper/AlbumUIMapper.dart';

part 'audio_player_manager_state.dart';

class AudioPlayerManagerCubit extends Cubit<AudioPlayerManagerState> {
  AudioPlayerManagerCubit() : super(AudioPlayerManagerState()) {
    init();
    _listenToChangesInPlaylist();
    _listenToPlaybackState();
  }

  final audioHandler = GetIt.I.get<AudioHandler>();
  final getMultipleAlbumsUseCase = GetIt.I.get<GetMultipleAlbumUseCase>();
  final getAlbumUiMapper = GetIt.I.get<AlbumUiMapper>();

  final List<AlbumUiModel> recentlyPlayedList = [];

  void init() {
    getMultipleAlbumsUseCase.perform(
        handleMultipleAlbumResponse, error, complete, "empty_param_string");
  }

  void playAudio() => audioHandler.play();

  void pauseAudio() => audioHandler.pause();

  // Updates the playList of type String
  void _listenToChangesInPlaylist() {
    audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) return;
      final newList = playlist.map((item) => item.title).toList();
      AudioPlayerManagerState().playList = newList;
    });
  }

  // Listening to all the state of the AudioPlayer
  // And Managing the state here in the cubit App layer
  // Todo : Create smart States for those remaining states Play/Pause/Seek

  void _listenToPlaybackState() {
    audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        AudioPlayerManagerState().playButtonState?.isLoading = true;
        emit((AudioPlayerManagerState().playButtonState?.isLoading ?? false)
            as AudioPlayerManagerState);
      } else if (!isPlaying) {
        AudioPlayerManagerState().playButtonState?.isPaused = true;
        emit((AudioPlayerManagerState().playButtonState?.isPaused ?? false)
            as AudioPlayerManagerState);
      } else if (processingState != AudioProcessingState.completed) {
        AudioPlayerManagerState().playButtonState?.isPlaying = true;
        emit((AudioPlayerManagerState().playButtonState?.isPlaying ?? false)
            as AudioPlayerManagerState);
      } else {
        // _audioHandler.seek(Duration.zero);
        AudioPlayerManagerState().playButtonState?.isPaused = true;
        emit((AudioPlayerManagerState().playButtonState?.isPaused ?? false)
            as AudioPlayerManagerState);
        ;
      }
    });
  }

  void handleMultipleAlbumResponse(List<AlbumDm>? response) {
    if (response != null && response.isNotEmpty) {
      response.forEach((element) {
        recentlyPlayedList.add(getAlbumUiMapper.mapToUiModel(element));
      });

      final getTrackItems = recentlyPlayedList[0].tracks.itemList;
      final mediaItemList = getTrackItems
          .map((e) => MediaItem(
              id: "some_random_id",
              title: "some_random_title",
              duration: Duration(milliseconds: e.durationInMs)))
          .toList();
      audioHandler.addQueueItems(mediaItemList);
    } else {
      print("Response is empty");
    }
  }

  void complete() {}

  error(e) {}
}
