import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/features/song_play/audio_player_manager_cubit.dart';
import 'package:praxis_flutter/mapper/AlbumUIMapper.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';

part 'audio_player_manager_event.dart';

part 'audio_player_manager_state.dart';

class AudioPlayerManagerBloc
    extends Bloc<AudioPlayerManagerEvent, AudioPlayerManagerBlocState> {
  AudioPlayerManagerBloc() : super(InitialState()) {
    on<LoadDataAndInitializePlayerEvent>(loadAndInitializeAudioPlayer);
    on<AudioPlayerPlayEvent>(_listenToPlayBackState);
    on<AudioPlayerPauseEvent>(_listenToPlayBackState);
    on<AudioPlayerSeekPositionEvent>(_listenToSeekProgressState);
    on<AudioPlayerNextTrackEvent>(_listenToSkipState);
    on<AudioPlayerPreviousTrackEvent>(_listenToSkipState);
    on<AudioPlayerRepeatTrackEvent>(_listenToRepeatModeState);
    on<AudioPlayerShuffleTrackEvent>(_listenToShuffleState);
  }

  final audioHandler = GetIt.I.get<AudioHandler>();
  final getMultipleAlbumsUseCase = GetIt.I.get<GetMultipleAlbumUseCase>();
  final getAlbumUiMapper = GetIt.I.get<AlbumUiMapper>();

  Future<void> loadAndInitializeAudioPlayer(
    LoadDataAndInitializePlayerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) async {
    final getTrackItems = event.trackUiModel.itemList;
    final mediaItemList = getTrackItems
        .map(
          (e) => MediaItem(
              id: e.itemId,
              title: e.trackName,
              artist: e.artist,
              duration: const Duration(milliseconds: 30000),
              // Extra Parameters takes the source for the Audio File.
              extras: {'url': e.hrefMp3}),
        )
        .toList();

    await audioHandler.addQueueItems(mediaItemList);
  }

  void _listenToPlayBackState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    if (event is AudioPlayerPlayEvent) {
      audioHandler.play();
    }

    if (event is AudioPlayerPauseEvent) {
      audioHandler.pause();
    }

    audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {

        emit(
          const CurrentSongPlayButtonState(
              isPlaying: false, isLoading: true, isPause: false),
        );
      } else if (!isPlaying) {
        emit(
          const CurrentSongPlayButtonState(
              isPlaying: false, isLoading: false, isPause: true),
        );
      } else if (processingState != AudioProcessingState.completed) {
        emit(
          const CurrentSongPlayButtonState(
              isPlaying: true, isLoading: false, isPause: false),
        );
      } else {
        audioHandler.seek(Duration.zero);
        emit(
          const CurrentSongPlayButtonState(
              isPlaying: false, isLoading: false, isPause: false),
        );
      }
    });
  }

  void _listenToSeekProgressState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    if (event is AudioPlayerSeekPositionEvent) {
      audioHandler.seek(event.duration);
    }

    // Current Position Listener
    AudioService.position.listen((progress) {
      emit(CurrentSongProgressBarState(
          currentPosition: progress.inMilliseconds,
          buffered: 0,
          totalLength: 0));
    });

    // Buffered Position Listener
    audioHandler.playbackState.listen((bufferedProgress) {
      emit(
        CurrentSongProgressBarState(
            currentPosition:
                (state as CurrentSongProgressBarState).currentPosition,
            buffered: bufferedProgress.bufferedPosition.inMilliseconds,
            totalLength: 0),
      );
    });

    // Total Position Listener
    audioHandler.mediaItem.listen((totalDuration) {
      emit(CurrentSongProgressBarState(
          currentPosition:
              (state as CurrentSongProgressBarState).currentPosition,
          buffered: (state as CurrentSongProgressBarState).buffered,
          totalLength: totalDuration?.duration?.inMilliseconds ??
              Duration.zero.inMilliseconds));
    });
  }

  void _listenToSkipState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    if (event is AudioPlayerNextTrackEvent) {
      audioHandler.skipToNext();
    }

    if (event is AudioPlayerPreviousTrackEvent) {
      audioHandler.skipToPrevious();
    }

    // Updating the Song Title and Artist value
    audioHandler.mediaItem.listen((event) {
      // Update the Track Title and Artist name
      emit(CurrentPlayerSongTitleState(
          songTitle: event?.title.toString() ?? ""));
      emit(CurrentPlayerArtistNameState(
          artistName: event?.artist.toString() ?? ""));

      final mediaItem = audioHandler.mediaItem.valueWrapper?.value;
      final playlist = audioHandler.queue.valueWrapper?.value;

      // No Data available, disable the Skip buttons.
      if (playlist == null || playlist.length < 2 || mediaItem == null) {
        emit(const PlayerLastSongNotifier(isLastSongNotifier: false));
        emit(const PlayerFirstSongNotifier(isFirstSongNotifier: false));
      } else {
        emit(PlayerFirstSongNotifier(
            isFirstSongNotifier: playlist.first == mediaItem));
        emit(PlayerLastSongNotifier(
            isLastSongNotifier: playlist.last == mediaItem));
      }
    });
  }

  void _listenToRepeatModeState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    emit(const PlayerRepeatModeState(
      isRepeatSongEnabled: false,
      isRepeatPlayListEnabled: false,
    ));
    if (event is AudioPlayerRepeatTrackEvent) {
      final currentRepeatMode = event.repeatState;
      switch (currentRepeatMode) {
        case RepeatState.OFF:
          audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
          emit(const PlayerRepeatModeState(
            isRepeatSongEnabled: false,
            isRepeatPlayListEnabled: false,
          ));
          break;
        case RepeatState.REPEAT_SONG:
          audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
          emit(const PlayerRepeatModeState(
            isRepeatSongEnabled: true,
            isRepeatPlayListEnabled: false,
          ));
          break;
        case RepeatState.REPEAT_PLAYLIST:
          audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
          emit(const PlayerRepeatModeState(
            isRepeatSongEnabled: false,
            isRepeatPlayListEnabled: true,
          ));
          break;
      }
    }
  }

  void _listenToShuffleState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    if (event is AudioPlayerShuffleTrackEvent) {
      final lastState = (state as IsPlayerShuffleMode).isShuffleModeEnabled;
      if (lastState) {
        audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
        emit(const IsPlayerShuffleMode(isShuffleModeEnabled: true));
      } else {
        audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
        emit(const IsPlayerShuffleMode(isShuffleModeEnabled: false));
      }
    }
  }

  @override
  Future<void> close() {
    audioHandler.stop();
    return super.close();
  }
}
