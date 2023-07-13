import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'spotify_mini_player_event.dart';

part 'spotify_mini_player_state.dart';

class SpotifyMiniPlayerBloc
    extends Bloc<SpotifyMiniPlayerEvent, SpotifyMiniPlayerEnableState> {
  SpotifyMiniPlayerBloc() : super(SpotifyMiniPlayerEnableState.initial()) {
    on<PlayMiniPlayerEvent>(
        (event, emit) => _listenToPlayPauseState(event, emit));
    on<PauseMiniPlayerEvent>(
        (event, emit) => _listenToPlayPauseState(event, emit));
    on<SwipeToNextMiniPlayerEvent>((event, emit) => _nextAudio(event, emit));
    on<SwipeToPreviousMiniPlayerEvent>(
        (event, emit) => _previousAudio(event, emit));
    on<UpdateMiniPlayerEvent>((event, emit) => _updateUi(event, emit));

    _listenForMediaItemChange();
    _listenForPlayPauseState();
    _listenToSeekProgressState();
  }

  final _audioPlayerHandler = GetIt.I.get<AudioHandler>();

  // Handled ✅
  Future<void> _listenToSeekProgressState() async {
    AudioService.position.listen(
      (Duration currentPosition) {
        add(UpdateMiniPlayerEvent(state.copyWith(
            currentProgressState: currentPosition.inSeconds,
            totalProgressValue: 30)));
      },
    );
  }

  // Updates UI ✅
  void _updateUi(
    UpdateMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    emit(event.currentState);
  }

  // Updates : Play,Pause,Artist,Track  ✅
  void _listenToPlayPauseState(
    SpotifyMiniPlayerEvent event,
    Emitter<SpotifyMiniPlayerEnableState> emit,
  ) {
    if (event is PlayMiniPlayerEvent) {
      _audioPlayerHandler.play();
    }

    if (event is PauseMiniPlayerEvent) {
      _audioPlayerHandler.pause();
    }
  }

  void _listenForMediaItemChange() {
    _audioPlayerHandler.mediaItem.listen(
      (mediaItem) {
        if (mediaItem != null) {
          add(
            UpdateMiniPlayerEvent(
              state.copyWith(
                trackArtist: mediaItem.artist.toString(),
                trackTitle: mediaItem.title.toString(),
              ),
            ),
          );
        }
      },
    );
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

  void _listenForPlayPauseState() {
    // Attaching Listener
    _audioPlayerHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        // Adding the Update UI Event : For Loading State
        add(UpdateMiniPlayerEvent(state.copyWith(isPlaying: false)));
      } else if (!isPlaying) {
        // Adding the Update UI Event : For Pause State
        add(UpdateMiniPlayerEvent(state.copyWith(isPlaying: false)));
      } else if (processingState != AudioProcessingState.completed) {
        // Adding the Update UI Event : For Playing State
        add(UpdateMiniPlayerEvent(state.copyWith(isPlaying: true)));
      } else {
        _audioPlayerHandler.seek(Duration.zero);
        // Adding the Update UI Event : For Idle State
        add(UpdateMiniPlayerEvent(state.copyWith(isPlaying: false)));
      }
    });
  }
}
