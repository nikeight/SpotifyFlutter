import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/mapper/AlbumUIMapper.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rxdart/rxdart.dart';

part 'audio_player_manager_event.dart';

part 'audio_player_manager_state.dart';

class AudioPlayerManagerBloc
    extends Bloc<AudioPlayerManagerEvent, AudioPlayerManagerBlocState> {
  AudioPlayerManagerBloc()
      : super(const AudioPlayerManagerBlocState.initial()) {
    on<LoadDataAndInitializePlayerEvent>(_loadAndInitializeAudioPlayerState,
        transformer: restartable());
    on<AudioPlayerCurrentTrackTitleEvent>(_listenToCurrentTrackTitleState,
        transformer: restartable());
    on<AudioPlayerCurrentTrackArtistEvent>(_listenToCurrentTrackArtistState,
        transformer: restartable());
    on<AudioPlayerPlayEvent>(_listenToPlayBackState,
        transformer: restartable());
    on<AudioPlayerPauseEvent>(_listenToPlayBackState,
        transformer: restartable());
    on<AudioPlayerSeekPositionEvent>(_listenToSeekProgressState,
        transformer: restartable());
    on<AudioPlayerNextTrackEvent>(_listenToSkipState,
        transformer: restartable());
    on<AudioPlayerPreviousTrackEvent>(_listenToSkipState,
        transformer: restartable());
    on<AudioPlayerRepeatTrackEvent>(_listenToRepeatModeState,
        transformer: restartable());
    on<AudioPlayerShuffleTrackEvent>(_listenToShuffleState,
        transformer: restartable());
  }

  final audioHandler = GetIt.I.get<AudioHandler>();
  final getMultipleAlbumsUseCase = GetIt.I.get<GetMultipleAlbumUseCase>();
  final getAlbumUiMapper = GetIt.I.get<AlbumUiMapper>();

  // Handled ✅
  Future<void> _loadAndInitializeAudioPlayerState(
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

  // Handled ✅
  Future<void> _listenToPlayBackState(AudioPlayerManagerEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    // Handle Play Pause Events
    if (event is AudioPlayerPlayEvent) {
      audioHandler.play();
    }

    if (event is AudioPlayerPauseEvent) {
      audioHandler.pause();
    }

    await emit.forEach(audioHandler.playbackState,
        onData: (PlaybackState playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        return AudioPlayerManagerBlocState.success(
          trackTitleName: state.trackArtistName,
          trackArtistName: state.trackArtistName,
          fetchedPlayList: state.fetchedPlayList,
          progressBarTotalValue: state.progressBarTotalValue,
          progressBarBufferedValue: state.progressBarBufferedValue,
          progressBarCurrentValue: state.progressBarCurrentValue,
          isAudioPlayerLoading: true,
          isAudioPlayerPlaying: false,
          isAudioPlayerPaused: false,
          isShuffledModeEnabled: state.isShuffledModeEnabled,
          isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
          isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
          isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
          isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
        );
      } else if (!isPlaying) {
        return AudioPlayerManagerBlocState.success(
          trackTitleName: state.trackArtistName,
          trackArtistName: state.trackArtistName,
          fetchedPlayList: state.fetchedPlayList,
          progressBarTotalValue: state.progressBarTotalValue,
          progressBarBufferedValue: state.progressBarBufferedValue,
          progressBarCurrentValue: state.progressBarCurrentValue,
          isAudioPlayerLoading: false,
          isAudioPlayerPlaying: false,
          isAudioPlayerPaused: true,
          isShuffledModeEnabled: state.isShuffledModeEnabled,
          isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
          isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
          isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
          isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
        );
      } else if (processingState != AudioProcessingState.completed) {
        return AudioPlayerManagerBlocState.success(
          trackTitleName: state.trackArtistName,
          trackArtistName: state.trackArtistName,
          fetchedPlayList: state.fetchedPlayList,
          progressBarTotalValue: state.progressBarTotalValue,
          progressBarBufferedValue: state.progressBarBufferedValue,
          progressBarCurrentValue: state.progressBarCurrentValue,
          isAudioPlayerLoading: false,
          isAudioPlayerPlaying: true,
          isAudioPlayerPaused: false,
          isShuffledModeEnabled: state.isShuffledModeEnabled,
          isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
          isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
          isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
          isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
        );
      } else {
        audioHandler.seek(Duration.zero);
        return AudioPlayerManagerBlocState.success(
          trackTitleName: state.trackArtistName,
          trackArtistName: state.trackArtistName,
          fetchedPlayList: state.fetchedPlayList,
          progressBarTotalValue: state.progressBarTotalValue,
          progressBarBufferedValue: state.progressBarBufferedValue,
          progressBarCurrentValue: state.progressBarCurrentValue,
          isAudioPlayerLoading: false,
          isAudioPlayerPlaying: false,
          isAudioPlayerPaused: true,
          isShuffledModeEnabled: state.isShuffledModeEnabled,
          isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
          isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
          isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
          isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
        );
      }
    });
  }

  // Update the Artist Title
  Future<void> _listenToCurrentTrackArtistState(AudioPlayerManagerEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    await emit.forEach(audioHandler.mediaItem, onData: (MediaItem? mediaItem) {
      // Update the Track Title and Artist name
      return AudioPlayerManagerBlocState.success(
        trackTitleName: state.trackArtistName,
        trackArtistName: mediaItem?.artist.toString() ?? "",
        fetchedPlayList: state.fetchedPlayList,
        progressBarTotalValue: state.progressBarTotalValue,
        progressBarBufferedValue: state.progressBarBufferedValue,
        progressBarCurrentValue: state.progressBarCurrentValue,
        isAudioPlayerLoading: state.isAudioPlayerLoading,
        isAudioPlayerPlaying: state.isAudioPlayerPlaying,
        isAudioPlayerPaused: state.isAudioPlayerPaused,
        isShuffledModeEnabled: state.isShuffledModeEnabled,
        isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
        isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
        isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
        isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
      );
    });
  }

  // Update the Track Song Title
  Future<void> _listenToCurrentTrackTitleState(AudioPlayerManagerEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    await emit.forEach(audioHandler.mediaItem, onData: (MediaItem? mediaItem) {
      return AudioPlayerManagerBlocState.success(
        trackTitleName: mediaItem?.title.toString() ?? "",
        trackArtistName: state.trackArtistName,
        fetchedPlayList: state.fetchedPlayList,
        progressBarTotalValue: state.progressBarTotalValue,
        progressBarBufferedValue: state.progressBarBufferedValue,
        progressBarCurrentValue: state.progressBarCurrentValue,
        isAudioPlayerLoading: state.isAudioPlayerLoading,
        isAudioPlayerPlaying: state.isAudioPlayerPlaying,
        isAudioPlayerPaused: state.isAudioPlayerPaused,
        isShuffledModeEnabled: state.isShuffledModeEnabled,
        isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
        isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
        isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
        isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
      );
    });
  }

  Future<void> _listenToSeekProgressState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) async {
    if (event is AudioPlayerSeekPositionEvent) {
      audioHandler.seek(event.duration);
    }

    // Update the Total Duration Position State
    await emit.forEach(audioHandler.mediaItem,
        onData: (MediaItem? totalDuration) =>
            AudioPlayerManagerBlocState.success(
              trackTitleName: state.trackTitleName,
              trackArtistName: state.trackArtistName,
              fetchedPlayList: state.fetchedPlayList,
              progressBarTotalValue:
                  totalDuration?.duration?.inSeconds ?? Duration.zero.inSeconds,
              progressBarBufferedValue: state.progressBarBufferedValue,
              progressBarCurrentValue: state.progressBarCurrentValue,
              isAudioPlayerLoading: state.isAudioPlayerLoading,
              isAudioPlayerPlaying: state.isAudioPlayerPlaying,
              isAudioPlayerPaused: state.isAudioPlayerPaused,
              isShuffledModeEnabled: state.isShuffledModeEnabled,
              isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
              isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
              isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
              isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
            ));

    // Update Current Position State
    await emit.forEach(AudioService.position,
        onData: (Duration currentPosition) =>
            AudioPlayerManagerBlocState.success(
              trackTitleName: state.trackTitleName,
              trackArtistName: state.trackArtistName,
              fetchedPlayList: state.fetchedPlayList,
              progressBarTotalValue: state.progressBarTotalValue,
              progressBarBufferedValue: state.progressBarBufferedValue,
              progressBarCurrentValue: currentPosition.inSeconds,
              isAudioPlayerLoading: state.isAudioPlayerLoading,
              isAudioPlayerPlaying: state.isAudioPlayerPlaying,
              isAudioPlayerPaused: state.isAudioPlayerPaused,
              isShuffledModeEnabled: state.isShuffledModeEnabled,
              isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
              isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
              isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
              isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
            ));

    // Update Buffered Position State
    await emit.forEach(audioHandler.playbackState,
        onData: (PlaybackState bufferedPosition) =>
            AudioPlayerManagerBlocState.success(
              trackTitleName: state.trackTitleName,
              trackArtistName: state.trackArtistName,
              fetchedPlayList: state.fetchedPlayList,
              progressBarTotalValue: state.progressBarTotalValue,
              progressBarBufferedValue:
                  bufferedPosition.bufferedPosition.inSeconds,
              progressBarCurrentValue: state.progressBarCurrentValue,
              isAudioPlayerLoading: state.isAudioPlayerLoading,
              isAudioPlayerPlaying: state.isAudioPlayerPlaying,
              isAudioPlayerPaused: state.isAudioPlayerPaused,
              isShuffledModeEnabled: state.isShuffledModeEnabled,
              isLastSongNotifierEnabled: state.isLastSongNotifierEnabled,
              isFirstSongNotifierEnabled: state.isFirstSongNotifierEnabled,
              isRepeatSongModeEnabled: state.isRepeatSongModeEnabled,
              isRepeatAlbumModeEnabled: state.isRepeatAlbumModeEnabled,
            ));
  }

  Future<void> _listenToSkipState(AudioPlayerManagerEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    if (event is AudioPlayerNextTrackEvent) {
      audioHandler.skipToNext();
    }

    if (event is AudioPlayerPreviousTrackEvent) {
      audioHandler.skipToPrevious();
    }

    // await emit.forEach(audioHandler.mediaItem, onData: (MediaItem? mediaItem) {
    //   // Update the Track Title and Artist name
    //   return CurrentPlayerSongTitleState(
    //       songTitle: mediaItem?.title.toString() ?? "");
    // });
    //
    // await emit.forEach(audioHandler.mediaItem, onData: (MediaItem? mediaItem) {
    //   // Update the Track Title and Artist name
    //   return CurrentPlayerArtistNameState(
    //       artistName: mediaItem?.artist.toString() ?? "");
    // });
    //
    // // Todo : Setup those two State in One and Add the Logic at UI Layer (Next,Previous btn)
    // // Updating the Song Title and Artist value
    // audioHandler.mediaItem.listen((event) {
    //   // Update the Track Title and Artist name
    //   // emit(CurrentPlayerSongTitleState(
    //   //     songTitle: event?.title.toString() ?? ""));
    //   // emit(CurrentPlayerArtistNameState(
    //   //     artistName: event?.artist.toString() ?? ""));
    //
    //   final mediaItem = audioHandler.mediaItem.valueWrapper?.value;
    //   final playlist = audioHandler.queue.valueWrapper?.value;
    //
    //   // No Data available, disable the Skip buttons.
    //   if (playlist == null || playlist.length < 2 || mediaItem == null) {
    //     emit(const PlayerLastSongNotifier(isLastSongNotifier: false));
    //     emit(const PlayerFirstSongNotifier(isFirstSongNotifier: false));
    //   } else {
    //     emit(PlayerFirstSongNotifier(
    //         isFirstSongNotifier: playlist.first == mediaItem));
    //     emit(PlayerLastSongNotifier(
    //         isLastSongNotifier: playlist.last == mediaItem));
    //   }
    // });
  }

  void _listenToRepeatModeState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    // emit(const PlayerRepeatModeState(
    //   isRepeatSongEnabled: false,
    //   isRepeatPlayListEnabled: false,
    // ));
    // if (event is AudioPlayerRepeatTrackEvent) {
    //   final currentRepeatMode = event.repeatState;
    //   switch (currentRepeatMode) {
    //     case RepeatState.OFF:
    //       audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
    //       emit(const PlayerRepeatModeState(
    //         isRepeatSongEnabled: false,
    //         isRepeatPlayListEnabled: false,
    //       ));
    //       break;
    //     case RepeatState.REPEAT_SONG:
    //       audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
    //       emit(const PlayerRepeatModeState(
    //         isRepeatSongEnabled: true,
    //         isRepeatPlayListEnabled: false,
    //       ));
    //       break;
    //     case RepeatState.REPEAT_PLAYLIST:
    //       audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
    //       emit(const PlayerRepeatModeState(
    //         isRepeatSongEnabled: false,
    //         isRepeatPlayListEnabled: true,
    //       ));
    //       break;
    //   }
    // }
  }

  void _listenToShuffleState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    // if (event is AudioPlayerShuffleTrackEvent) {
    //   final lastState = (state as IsPlayerShuffleMode).isShuffleModeEnabled;
    //   if (lastState) {
    //     audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
    //     emit(const IsPlayerShuffleMode(isShuffleModeEnabled: true));
    //   } else {
    //     audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    //     emit(const IsPlayerShuffleMode(isShuffleModeEnabled: false));
    //   }
    // }
  }

  @override
  Future<void> close() {
    audioHandler.stop();
    return super.close();
  }
}
