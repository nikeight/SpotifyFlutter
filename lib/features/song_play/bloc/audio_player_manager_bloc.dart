import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/mapper/AlbumUIMapper.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';

part 'audio_player_manager_event.dart';

part 'audio_player_manager_state.dart';

class AudioPlayerManagerBloc
    extends Bloc<AudioPlayerManagerEvent, AudioPlayerManagerBlocState> {
  AudioPlayerManagerBloc()
      : super(
          AudioPlayerManagerBlocState.initial(),
        ) {
    // Reacting to Different Events
    on<LoadDataAndInitializePlayerEvent>(_loadAndInitializeAudioPlayerState);
    on<UpdateCompleteUiEvent>(_updateCompleteUi);
    on<UpdateTrackTitleAndArtistEvent>(_listenToCurrentTrackArtistState);
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

  // Handled ✅
  // Update the Whole State
  void _updateCompleteUi(
    UpdateCompleteUiEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    emit(event.audioPlayerManagerBlocState);
  }

  // Handled ✅
  Future<void> _loadAndInitializeAudioPlayerState(
    LoadDataAndInitializePlayerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) async {
    print("ActualState - Loading ${(state).audioPlayerStateModel}");
    final getTrackItems = event.trackUiModel.itemList;
    final mediaItemList = getTrackItems
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

    await audioHandler.addQueueItems(mediaItemList);
  }

  // Handled ✅
  Future<void> _listenToPlayBackState(AudioPlayerManagerEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    print("ActualState - Play/Pause ${(state).audioPlayerStateModel}");

    // Handle Play Pause Events
    if (event is AudioPlayerPlayEvent) {
      audioHandler.play();
    }

    if (event is AudioPlayerPauseEvent) {
      audioHandler.pause();
    }

    audioHandler.playbackState.listen(
      (playbackState) {
        final isPlaying = playbackState.playing;
        final processingState = playbackState.processingState;
        if (processingState == AudioProcessingState.loading ||
            processingState == AudioProcessingState.buffering) {
          // Adding the Update UI Event : For Loading State
          add(
            UpdateCompleteUiEvent(
              state.copyWith(
                currentPlayerPlayPauseBtnState:
                    CurrentPlayerPlayPauseBtnState(false, false, true),
              ),
            ),
          );
        } else if (!isPlaying) {
          // Adding the Update UI Event : For Pause State
          add(
            UpdateCompleteUiEvent(
              state.copyWith(
                currentPlayerPlayPauseBtnState:
                    CurrentPlayerPlayPauseBtnState(false, true, false),
              ),
            ),
          );
        } else if (processingState != AudioProcessingState.completed) {
          // Adding the Update UI Event : For Playing State
          add(
            UpdateCompleteUiEvent(
              state.copyWith(
                currentPlayerPlayPauseBtnState:
                    CurrentPlayerPlayPauseBtnState(true, false, false),
              ),
            ),
          );
        } else {
          audioHandler.seek(Duration.zero);
          // Adding the Update UI Event : For Idle State
          add(
            UpdateCompleteUiEvent(
              state.copyWith(
                currentPlayerPlayPauseBtnState:
                    CurrentPlayerPlayPauseBtnState(false, true, false),
              ),
            ),
          );
        }
      },
    );
  }

  // Handled ✅
  // Update the Artist Title
  Future<void> _listenToCurrentTrackArtistState(
      UpdateTrackTitleAndArtistEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    emit.forEach(
      audioHandler.mediaItem,
      onData: (MediaItem? mediaItem) {
        _listenToSkipState(event, emit);
        if (mediaItem != null) {
          return state.copyWith(
            currentTrackDetailState: CurrentTrackDetailState(
                mediaItem.artist.toString(), mediaItem.title.toString()),
          );
        }
        return state;
      },
    );
  }

  // Handled ✅
  Future<void> _listenToSeekProgressState(
    AudioPlayerManagerEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) async {
    if (event is AudioPlayerSeekPositionEvent) {
      audioHandler.seek(event.duration);
    }

    AudioService.position.listen(
      (Duration currentPosition) {
        add(
          UpdateCompleteUiEvent(
            state.copyWith(
              currentProgressBarState:
                  CurrentProgressBarState(currentPosition.inSeconds, 30),
            ),
          ),
        );
      },
    );
  }

  Future<void> _listenToSkipState(AudioPlayerManagerEvent event,
      Emitter<AudioPlayerManagerBlocState> emit) async {
    if (event is AudioPlayerNextTrackEvent) {
      audioHandler.skipToNext();
    }

    if (event is AudioPlayerPreviousTrackEvent) {
      audioHandler.skipToPrevious();
    }

    final mediaItem = audioHandler.mediaItem.valueWrapper?.value;
    final playlist = audioHandler.queue.valueWrapper?.value;

    // No Data available, disable the Skip buttons.
    if (playlist == null || playlist.length < 2 || mediaItem == null) {
      add(
        UpdateCompleteUiEvent(
          state.copyWith(
            audioPlayerOtherBtnState:
                AudioPlayerOtherBtnState(false, false, false, false),
          ),
        ),
      );
    } else {
      add(
        UpdateCompleteUiEvent(
          state.copyWith(
            audioPlayerOtherBtnState: AudioPlayerOtherBtnState(
                playlist.first == mediaItem,
                playlist.last == mediaItem,
                false,
                false),
          ),
        ),
      );
    }
  }

  void _listenToRepeatModeState(
    AudioPlayerRepeatTrackEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    // Todo : Provide Support for Repeat ALL also
    final lastState = state.audioPlayerStateModel.audioPlayerOtherBtnState
            ?.isRepeatModeEnabled ??
        false;
    if (lastState) {
      audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
      emit(
        state.copyWith(
          audioPlayerOtherBtnState: AudioPlayerOtherBtnState(
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isNextTrackAvailable ??
                false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isPrevTrackAvailable ??
                false,
            true,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isShuffleModeEnabled ??
                false,
          ),
        ),
      );
    } else {
      audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
      emit(
        state.copyWith(
          audioPlayerOtherBtnState: AudioPlayerOtherBtnState(
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isNextTrackAvailable ??
                false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isPrevTrackAvailable ??
                false,
            false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isShuffleModeEnabled ??
                false,
          ),
        ),
      );
    }
  }

  void _listenToShuffleState(
    AudioPlayerShuffleTrackEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    final lastState = state.audioPlayerStateModel.audioPlayerOtherBtnState
            ?.isShuffleModeEnabled ??
        false;
    if (lastState) {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
      emit(
        state.copyWith(
          audioPlayerOtherBtnState: AudioPlayerOtherBtnState(
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isNextTrackAvailable ??
                false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isPrevTrackAvailable ??
                false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isRepeatModeEnabled ??
                false,
            true,
          ),
        ),
      );
    } else {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
      emit(
        state.copyWith(
          audioPlayerOtherBtnState: AudioPlayerOtherBtnState(
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isNextTrackAvailable ??
                false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isPrevTrackAvailable ??
                false,
            state.audioPlayerStateModel.audioPlayerOtherBtnState
                    ?.isRepeatModeEnabled ??
                false,
            false,
          ),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    audioHandler.stop();
    return super.close();
  }
}
