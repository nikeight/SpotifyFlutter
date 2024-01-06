import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter/features/song_play/bloc/audio_player_manager_state.dart';

part 'audio_player_manager_event.dart';

class AudioPlayerManagerBloc
    extends Bloc<AudioPlayerManagerEvent, AudioPlayerManagerBlocState> {
  AudioPlayerManagerBloc()
      : super(
          AudioPlayerManagerBlocState(
              audioPlayerStateModel: AudioPlayerStateModel(
            currentTrackDetailState: CurrentTrackDetailState(),
            currentProgressBarState: CurrentProgressBarState(),
            currentPlayerPlayPauseBtnState: CurrentPlayerPlayPauseBtnState(),
            audioPlayerOtherBtnState: AudioPlayerOtherBtnState(),
          )),
        ) {
    // Reacting to Different Events
    on<UpdateCompleteUiEvent>(_updateCompleteUi);
    on<UpdateTrackTitleAndArtistEvent>(_listenToCurrentTrackArtistState);
    on<AudioPlayerPlayEvent>(_listenToPlayBackState);
    on<AudioPlayerPauseEvent>(_listenToPlayBackState);
    on<AudioPlayerSeekPositionEvent>(_listenToSeekProgressState);
    on<AudioPlayerNextTrackEvent>(_listenToSkipState);
    on<AudioPlayerPreviousTrackEvent>(_listenToSkipState);
    on<AudioPlayerRepeatTrackEvent>(_listenToRepeatModeState);
    on<AudioPlayerShuffleTrackEvent>(_listenToShuffleState);

    add(UpdateTrackTitleAndArtistEvent());
    add(const AudioPlayerSeekPositionEvent(duration: Duration.zero));
    add(AudioPlayerPlayEvent());
  }

  final audioHandler = GetIt.I.get<AudioHandler>();

  // Handled ✅
  // Update the Whole State
  void _updateCompleteUi(
    UpdateCompleteUiEvent event,
    Emitter<AudioPlayerManagerBlocState> emit,
  ) {
    emit(event.audioPlayerManagerBlocState);
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
            UpdateCompleteUiEvent(state
                .copyWith.audioPlayerStateModel.currentPlayerPlayPauseBtnState!(
              isPlaying: false,
              isPaused: false,
              isLoading: true,
            )),
          );
        } else if (!isPlaying) {
          // Adding the Update UI Event : For Pause State
          add(
            UpdateCompleteUiEvent(state
                .copyWith.audioPlayerStateModel.currentPlayerPlayPauseBtnState!(
              isPlaying: false,
              isPaused: true,
              isLoading: false,
            )),
          );
        } else if (processingState != AudioProcessingState.completed) {
          // Adding the Update UI Event : For Playing State
          add(
            UpdateCompleteUiEvent(state
                .copyWith.audioPlayerStateModel.currentPlayerPlayPauseBtnState!(
              isPlaying: true,
              isPaused: false,
              isLoading: false,
            )),
          );
        } else {
          audioHandler.seek(Duration.zero);
          // Adding the Update UI Event : For Idle State
          add(
            UpdateCompleteUiEvent(state
                .copyWith.audioPlayerStateModel.currentPlayerPlayPauseBtnState!(
              isPlaying: false,
              isPaused: true,
              isLoading: false,
            )),
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
          return state.copyWith.audioPlayerStateModel.currentTrackDetailState!(
            artistName: mediaItem.artist.toString(),
            trackTitle: mediaItem.title.toString(),
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
              state.copyWith.audioPlayerStateModel.currentProgressBarState!(
            currentProgress: currentPosition.inSeconds,
            totalProgress: 30,
          )),
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
            state.copyWith.audioPlayerStateModel.audioPlayerOtherBtnState!(
          isNextTrackAvailable: false,
          isPrevTrackAvailable: false,
          isRepeatModeEnabled: false,
          isShuffleModeEnabled: false,
        )),
      );
    } else {
      add(
        UpdateCompleteUiEvent(
            state.copyWith.audioPlayerStateModel.audioPlayerOtherBtnState!(
          isNextTrackAvailable: playlist.first == mediaItem,
          isPrevTrackAvailable: playlist.last == mediaItem,
          isRepeatModeEnabled: false,
          isShuffleModeEnabled: false,
        )),
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
        state.copyWith.audioPlayerStateModel.audioPlayerOtherBtnState!(
          isNextTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isNextTrackAvailable ??
              false,
          isPrevTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isPrevTrackAvailable ??
              false,
          isRepeatModeEnabled: true,
          isShuffleModeEnabled: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isShuffleModeEnabled ??
              false,
        ),
      );
    } else {
      audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
      emit(
        state.copyWith.audioPlayerStateModel.audioPlayerOtherBtnState!(
          isNextTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isNextTrackAvailable ??
              false,
          isPrevTrackAvailable: false,
          isRepeatModeEnabled: false,
          isShuffleModeEnabled: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isShuffleModeEnabled ??
              false,
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
        state.copyWith.audioPlayerStateModel.audioPlayerOtherBtnState!(
          isNextTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isNextTrackAvailable ??
              false,
          isPrevTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isPrevTrackAvailable ??
              false,
          isRepeatModeEnabled: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isRepeatModeEnabled ??
              false,
          isShuffleModeEnabled: true,
        ),
      );
    } else {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
      emit(
        state.copyWith.audioPlayerStateModel.audioPlayerOtherBtnState!(
          isNextTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isNextTrackAvailable ??
              false,
          isPrevTrackAvailable: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isPrevTrackAvailable ??
              false,
          isRepeatModeEnabled: state.audioPlayerStateModel
                  .audioPlayerOtherBtnState?.isRepeatModeEnabled ??
              false,
          isShuffleModeEnabled: false,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
