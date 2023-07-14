import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:praxis_flutter/features/song_play/bloc/audio_player_manager_bloc.dart';

part 'spotify_mini_player_event.dart';

part 'spotify_mini_player_state.dart';

class SpotifyMiniPlayerBloc
    extends Bloc<SpotifyMiniPlayerEvent, SpotifyMiniPlayerEnableState> {
  SpotifyMiniPlayerBloc() : super(SpotifyMiniPlayerEnableState.initial()) {
    on<PlayMiniPlayerEvent>((event, emit) => _listenToPlayState(event, emit));
    on<PauseMiniPlayerEvent>((event, emit) => _listenToPauseState(event, emit));
    on<SwipeToNextMiniPlayerEvent>((event, emit) => _nextAudio(event, emit));
    on<SwipeToPreviousMiniPlayerEvent>(
        (event, emit) => _previousAudio(event, emit));
    on<UpdateMiniPlayerEvent>((event, emit) => _updateUi(event, emit));
    on<CheckForProcessStateEvent>(
        (event, emit) => _listenForMiniPlayerState(event, emit));
    on<UpdateMiniPlayerArtistAndTrackDetails>(
        (event, emit) => _listenForMediaItemChange(event, emit));

    _listenToSeekProgressState();
  }

  final _audioPlayerHandler = GetIt.I.get<AudioHandler>();

  // Updates UI ✅
  void _updateUi(
    UpdateMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    emit(event.currentState);
  }

  // Handled ✅
  Future<void> _listenToSeekProgressState() async {
    AudioService.position.listen(
      (Duration currentPosition) {
        add(
          UpdateMiniPlayerEvent(
            state.copyWith(
              currentProgressState: currentPosition.inSeconds,
              totalProgressValue: 30,
            ),
          ),
        );
      },
    );
  }

  void _listenToPauseState(
    PauseMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    // Pause Event
    _audioPlayerHandler.pause();

    // Attaching Listener
    _audioPlayerHandler.playbackState.listen(
      (playbackState) {
        final isPlaying = playbackState.playing;
        print("MiniPlayerBlocLog : IsPlaying $isPlaying");
        final processingState = playbackState.processingState;
        if (processingState == AudioProcessingState.loading ||
            processingState == AudioProcessingState.buffering) {
          // Adding the Update UI Event : For Loading State
          add(UpdateMiniPlayerEvent(
              state.copyWith(isLoading: true, isPlaying: false)));
        } else if (!isPlaying) {
          // Adding the Update UI Event : For Pause State
          add(UpdateMiniPlayerEvent(
              state.copyWith(isLoading: false, isPlaying: false)));
        } else if (processingState != AudioProcessingState.completed) {
          // Adding the Update UI Event : For Playing State
          _listenForMiniPlayerState(CheckForProcessStateEvent(), emit);
          add(UpdateMiniPlayerEvent(
              state.copyWith(isLoading: false, isPlaying: true)));
        } else {
          _audioPlayerHandler.seek(Duration.zero);
          // Adding the Update UI Event : For Idle State
          add(UpdateMiniPlayerEvent(state.copyWith(isPlaying: false)));
        }
      },
    );
  }

  void _listenToPlayState(
    PlayMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    // Play Event
    _audioPlayerHandler.play();

    // Attaching Listener
    _audioPlayerHandler.playbackState.listen(
      (playbackState) {
        final isPlaying = playbackState.playing;
        print("MiniPlayerBlocLog : IsPlaying $isPlaying");
        final processingState = playbackState.processingState;
        if (processingState == AudioProcessingState.loading ||
            processingState == AudioProcessingState.buffering) {
          // Adding the Update UI Event : For Loading State
          add(UpdateMiniPlayerEvent(
              state.copyWith(isLoading: true, isPlaying: false)));
        } else if (!isPlaying) {
          // Adding the Update UI Event : For Pause State
          add(UpdateMiniPlayerEvent(
              state.copyWith(isLoading: false, isPlaying: false)));
        } else if (processingState != AudioProcessingState.completed) {
          // Adding the Update UI Event : For Playing State
          _listenForMiniPlayerState(CheckForProcessStateEvent(), emit);
          add(UpdateMiniPlayerEvent(
              state.copyWith(isLoading: false, isPlaying: true)));
        } else {
          _audioPlayerHandler.seek(Duration.zero);
          // Adding the Update UI Event : For Idle State
          add(UpdateMiniPlayerEvent(state.copyWith(isPlaying: false)));
        }
      },
    );
  }

  Future<void> _listenForMediaItemChange(
      UpdateMiniPlayerArtistAndTrackDetails event,
      Emitter<SpotifyMiniPlayerEnableState> emit) async {
    _audioPlayerHandler.mediaItem.listen((mediaItem) {
      print("MiniPlayerBlocL : MediaItem $mediaItem");
      if (mediaItem != null) {
        add(UpdateMiniPlayerEvent(state.copyWith(
          trackArtist: mediaItem.artist.toString(),
          trackTitle: mediaItem.title.toString(),
        )));
      } else {
        add(UpdateMiniPlayerEvent(state));
      }
    });
  }

  // Swipe Next ✅
  void _nextAudio(
    SwipeToNextMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    _audioPlayerHandler.skipToNext();
  }

  // Swipe Previous ✅
  void _previousAudio(
    SwipeToPreviousMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    _audioPlayerHandler.skipToPrevious();
  }

  Future<void> _listenForMiniPlayerState(
    CheckForProcessStateEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) async {
    _audioPlayerHandler.playbackState.listen((playbackState) {
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.idle) {
        add(UpdateMiniPlayerEvent(state.copyWith(isMiniPlayerIdle: true)));
      } else {
        add(UpdateMiniPlayerEvent(state.copyWith(isMiniPlayerIdle: false)));
      }
    });
  }
}
