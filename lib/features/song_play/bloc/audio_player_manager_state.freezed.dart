// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_manager_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioPlayerManagerBlocState {
  AudioPlayerStateModel get audioPlayerStateModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlayerManagerBlocStateCopyWith<AudioPlayerManagerBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerManagerBlocStateCopyWith<$Res> {
  factory $AudioPlayerManagerBlocStateCopyWith(
          AudioPlayerManagerBlocState value,
          $Res Function(AudioPlayerManagerBlocState) then) =
      _$AudioPlayerManagerBlocStateCopyWithImpl<$Res,
          AudioPlayerManagerBlocState>;
  @useResult
  $Res call({AudioPlayerStateModel audioPlayerStateModel});

  $AudioPlayerStateModelCopyWith<$Res> get audioPlayerStateModel;
}

/// @nodoc
class _$AudioPlayerManagerBlocStateCopyWithImpl<$Res,
        $Val extends AudioPlayerManagerBlocState>
    implements $AudioPlayerManagerBlocStateCopyWith<$Res> {
  _$AudioPlayerManagerBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioPlayerStateModel = null,
  }) {
    return _then(_value.copyWith(
      audioPlayerStateModel: null == audioPlayerStateModel
          ? _value.audioPlayerStateModel
          : audioPlayerStateModel // ignore: cast_nullable_to_non_nullable
              as AudioPlayerStateModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioPlayerStateModelCopyWith<$Res> get audioPlayerStateModel {
    return $AudioPlayerStateModelCopyWith<$Res>(_value.audioPlayerStateModel,
        (value) {
      return _then(_value.copyWith(audioPlayerStateModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioPlayerManagerBlocStateImplCopyWith<$Res>
    implements $AudioPlayerManagerBlocStateCopyWith<$Res> {
  factory _$$AudioPlayerManagerBlocStateImplCopyWith(
          _$AudioPlayerManagerBlocStateImpl value,
          $Res Function(_$AudioPlayerManagerBlocStateImpl) then) =
      __$$AudioPlayerManagerBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AudioPlayerStateModel audioPlayerStateModel});

  @override
  $AudioPlayerStateModelCopyWith<$Res> get audioPlayerStateModel;
}

/// @nodoc
class __$$AudioPlayerManagerBlocStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerManagerBlocStateCopyWithImpl<$Res,
        _$AudioPlayerManagerBlocStateImpl>
    implements _$$AudioPlayerManagerBlocStateImplCopyWith<$Res> {
  __$$AudioPlayerManagerBlocStateImplCopyWithImpl(
      _$AudioPlayerManagerBlocStateImpl _value,
      $Res Function(_$AudioPlayerManagerBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioPlayerStateModel = null,
  }) {
    return _then(_$AudioPlayerManagerBlocStateImpl(
      audioPlayerStateModel: null == audioPlayerStateModel
          ? _value.audioPlayerStateModel
          : audioPlayerStateModel // ignore: cast_nullable_to_non_nullable
              as AudioPlayerStateModel,
    ));
  }
}

/// @nodoc

class _$AudioPlayerManagerBlocStateImpl
    implements _AudioPlayerManagerBlocState {
  _$AudioPlayerManagerBlocStateImpl({required this.audioPlayerStateModel});

  @override
  final AudioPlayerStateModel audioPlayerStateModel;

  @override
  String toString() {
    return 'AudioPlayerManagerBlocState(audioPlayerStateModel: $audioPlayerStateModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioPlayerManagerBlocStateImpl &&
            (identical(other.audioPlayerStateModel, audioPlayerStateModel) ||
                other.audioPlayerStateModel == audioPlayerStateModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioPlayerStateModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioPlayerManagerBlocStateImplCopyWith<_$AudioPlayerManagerBlocStateImpl>
      get copyWith => __$$AudioPlayerManagerBlocStateImplCopyWithImpl<
          _$AudioPlayerManagerBlocStateImpl>(this, _$identity);
}

abstract class _AudioPlayerManagerBlocState
    implements AudioPlayerManagerBlocState {
  factory _AudioPlayerManagerBlocState(
          {required final AudioPlayerStateModel audioPlayerStateModel}) =
      _$AudioPlayerManagerBlocStateImpl;

  @override
  AudioPlayerStateModel get audioPlayerStateModel;
  @override
  @JsonKey(ignore: true)
  _$$AudioPlayerManagerBlocStateImplCopyWith<_$AudioPlayerManagerBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioPlayerStateModel {
  CurrentTrackDetailState? get currentTrackDetailState =>
      throw _privateConstructorUsedError;
  CurrentProgressBarState? get currentProgressBarState =>
      throw _privateConstructorUsedError;
  CurrentPlayerPlayPauseBtnState? get currentPlayerPlayPauseBtnState =>
      throw _privateConstructorUsedError;
  AudioPlayerOtherBtnState? get audioPlayerOtherBtnState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlayerStateModelCopyWith<AudioPlayerStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateModelCopyWith<$Res> {
  factory $AudioPlayerStateModelCopyWith(AudioPlayerStateModel value,
          $Res Function(AudioPlayerStateModel) then) =
      _$AudioPlayerStateModelCopyWithImpl<$Res, AudioPlayerStateModel>;
  @useResult
  $Res call(
      {CurrentTrackDetailState? currentTrackDetailState,
      CurrentProgressBarState? currentProgressBarState,
      CurrentPlayerPlayPauseBtnState? currentPlayerPlayPauseBtnState,
      AudioPlayerOtherBtnState? audioPlayerOtherBtnState});

  $CurrentTrackDetailStateCopyWith<$Res>? get currentTrackDetailState;
  $CurrentProgressBarStateCopyWith<$Res>? get currentProgressBarState;
  $CurrentPlayerPlayPauseBtnStateCopyWith<$Res>?
      get currentPlayerPlayPauseBtnState;
  $AudioPlayerOtherBtnStateCopyWith<$Res>? get audioPlayerOtherBtnState;
}

/// @nodoc
class _$AudioPlayerStateModelCopyWithImpl<$Res,
        $Val extends AudioPlayerStateModel>
    implements $AudioPlayerStateModelCopyWith<$Res> {
  _$AudioPlayerStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrackDetailState = freezed,
    Object? currentProgressBarState = freezed,
    Object? currentPlayerPlayPauseBtnState = freezed,
    Object? audioPlayerOtherBtnState = freezed,
  }) {
    return _then(_value.copyWith(
      currentTrackDetailState: freezed == currentTrackDetailState
          ? _value.currentTrackDetailState
          : currentTrackDetailState // ignore: cast_nullable_to_non_nullable
              as CurrentTrackDetailState?,
      currentProgressBarState: freezed == currentProgressBarState
          ? _value.currentProgressBarState
          : currentProgressBarState // ignore: cast_nullable_to_non_nullable
              as CurrentProgressBarState?,
      currentPlayerPlayPauseBtnState: freezed == currentPlayerPlayPauseBtnState
          ? _value.currentPlayerPlayPauseBtnState
          : currentPlayerPlayPauseBtnState // ignore: cast_nullable_to_non_nullable
              as CurrentPlayerPlayPauseBtnState?,
      audioPlayerOtherBtnState: freezed == audioPlayerOtherBtnState
          ? _value.audioPlayerOtherBtnState
          : audioPlayerOtherBtnState // ignore: cast_nullable_to_non_nullable
              as AudioPlayerOtherBtnState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentTrackDetailStateCopyWith<$Res>? get currentTrackDetailState {
    if (_value.currentTrackDetailState == null) {
      return null;
    }

    return $CurrentTrackDetailStateCopyWith<$Res>(
        _value.currentTrackDetailState!, (value) {
      return _then(_value.copyWith(currentTrackDetailState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentProgressBarStateCopyWith<$Res>? get currentProgressBarState {
    if (_value.currentProgressBarState == null) {
      return null;
    }

    return $CurrentProgressBarStateCopyWith<$Res>(
        _value.currentProgressBarState!, (value) {
      return _then(_value.copyWith(currentProgressBarState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentPlayerPlayPauseBtnStateCopyWith<$Res>?
      get currentPlayerPlayPauseBtnState {
    if (_value.currentPlayerPlayPauseBtnState == null) {
      return null;
    }

    return $CurrentPlayerPlayPauseBtnStateCopyWith<$Res>(
        _value.currentPlayerPlayPauseBtnState!, (value) {
      return _then(
          _value.copyWith(currentPlayerPlayPauseBtnState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioPlayerOtherBtnStateCopyWith<$Res>? get audioPlayerOtherBtnState {
    if (_value.audioPlayerOtherBtnState == null) {
      return null;
    }

    return $AudioPlayerOtherBtnStateCopyWith<$Res>(
        _value.audioPlayerOtherBtnState!, (value) {
      return _then(_value.copyWith(audioPlayerOtherBtnState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioPlayerStateModelImplCopyWith<$Res>
    implements $AudioPlayerStateModelCopyWith<$Res> {
  factory _$$AudioPlayerStateModelImplCopyWith(
          _$AudioPlayerStateModelImpl value,
          $Res Function(_$AudioPlayerStateModelImpl) then) =
      __$$AudioPlayerStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrentTrackDetailState? currentTrackDetailState,
      CurrentProgressBarState? currentProgressBarState,
      CurrentPlayerPlayPauseBtnState? currentPlayerPlayPauseBtnState,
      AudioPlayerOtherBtnState? audioPlayerOtherBtnState});

  @override
  $CurrentTrackDetailStateCopyWith<$Res>? get currentTrackDetailState;
  @override
  $CurrentProgressBarStateCopyWith<$Res>? get currentProgressBarState;
  @override
  $CurrentPlayerPlayPauseBtnStateCopyWith<$Res>?
      get currentPlayerPlayPauseBtnState;
  @override
  $AudioPlayerOtherBtnStateCopyWith<$Res>? get audioPlayerOtherBtnState;
}

/// @nodoc
class __$$AudioPlayerStateModelImplCopyWithImpl<$Res>
    extends _$AudioPlayerStateModelCopyWithImpl<$Res,
        _$AudioPlayerStateModelImpl>
    implements _$$AudioPlayerStateModelImplCopyWith<$Res> {
  __$$AudioPlayerStateModelImplCopyWithImpl(_$AudioPlayerStateModelImpl _value,
      $Res Function(_$AudioPlayerStateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrackDetailState = freezed,
    Object? currentProgressBarState = freezed,
    Object? currentPlayerPlayPauseBtnState = freezed,
    Object? audioPlayerOtherBtnState = freezed,
  }) {
    return _then(_$AudioPlayerStateModelImpl(
      currentTrackDetailState: freezed == currentTrackDetailState
          ? _value.currentTrackDetailState
          : currentTrackDetailState // ignore: cast_nullable_to_non_nullable
              as CurrentTrackDetailState?,
      currentProgressBarState: freezed == currentProgressBarState
          ? _value.currentProgressBarState
          : currentProgressBarState // ignore: cast_nullable_to_non_nullable
              as CurrentProgressBarState?,
      currentPlayerPlayPauseBtnState: freezed == currentPlayerPlayPauseBtnState
          ? _value.currentPlayerPlayPauseBtnState
          : currentPlayerPlayPauseBtnState // ignore: cast_nullable_to_non_nullable
              as CurrentPlayerPlayPauseBtnState?,
      audioPlayerOtherBtnState: freezed == audioPlayerOtherBtnState
          ? _value.audioPlayerOtherBtnState
          : audioPlayerOtherBtnState // ignore: cast_nullable_to_non_nullable
              as AudioPlayerOtherBtnState?,
    ));
  }
}

/// @nodoc

class _$AudioPlayerStateModelImpl implements _AudioPlayerStateModel {
  _$AudioPlayerStateModelImpl(
      {required this.currentTrackDetailState,
      required this.currentProgressBarState,
      required this.currentPlayerPlayPauseBtnState,
      required this.audioPlayerOtherBtnState});

  @override
  final CurrentTrackDetailState? currentTrackDetailState;
  @override
  final CurrentProgressBarState? currentProgressBarState;
  @override
  final CurrentPlayerPlayPauseBtnState? currentPlayerPlayPauseBtnState;
  @override
  final AudioPlayerOtherBtnState? audioPlayerOtherBtnState;

  @override
  String toString() {
    return 'AudioPlayerStateModel(currentTrackDetailState: $currentTrackDetailState, currentProgressBarState: $currentProgressBarState, currentPlayerPlayPauseBtnState: $currentPlayerPlayPauseBtnState, audioPlayerOtherBtnState: $audioPlayerOtherBtnState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioPlayerStateModelImpl &&
            (identical(
                    other.currentTrackDetailState, currentTrackDetailState) ||
                other.currentTrackDetailState == currentTrackDetailState) &&
            (identical(
                    other.currentProgressBarState, currentProgressBarState) ||
                other.currentProgressBarState == currentProgressBarState) &&
            (identical(other.currentPlayerPlayPauseBtnState,
                    currentPlayerPlayPauseBtnState) ||
                other.currentPlayerPlayPauseBtnState ==
                    currentPlayerPlayPauseBtnState) &&
            (identical(
                    other.audioPlayerOtherBtnState, audioPlayerOtherBtnState) ||
                other.audioPlayerOtherBtnState == audioPlayerOtherBtnState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTrackDetailState,
      currentProgressBarState,
      currentPlayerPlayPauseBtnState,
      audioPlayerOtherBtnState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioPlayerStateModelImplCopyWith<_$AudioPlayerStateModelImpl>
      get copyWith => __$$AudioPlayerStateModelImplCopyWithImpl<
          _$AudioPlayerStateModelImpl>(this, _$identity);
}

abstract class _AudioPlayerStateModel implements AudioPlayerStateModel {
  factory _AudioPlayerStateModel(
          {required final CurrentTrackDetailState? currentTrackDetailState,
          required final CurrentProgressBarState? currentProgressBarState,
          required final CurrentPlayerPlayPauseBtnState?
              currentPlayerPlayPauseBtnState,
          required final AudioPlayerOtherBtnState? audioPlayerOtherBtnState}) =
      _$AudioPlayerStateModelImpl;

  @override
  CurrentTrackDetailState? get currentTrackDetailState;
  @override
  CurrentProgressBarState? get currentProgressBarState;
  @override
  CurrentPlayerPlayPauseBtnState? get currentPlayerPlayPauseBtnState;
  @override
  AudioPlayerOtherBtnState? get audioPlayerOtherBtnState;
  @override
  @JsonKey(ignore: true)
  _$$AudioPlayerStateModelImplCopyWith<_$AudioPlayerStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentTrackDetailState {
  String get artistName => throw _privateConstructorUsedError;
  String get trackTitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentTrackDetailStateCopyWith<CurrentTrackDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentTrackDetailStateCopyWith<$Res> {
  factory $CurrentTrackDetailStateCopyWith(CurrentTrackDetailState value,
          $Res Function(CurrentTrackDetailState) then) =
      _$CurrentTrackDetailStateCopyWithImpl<$Res, CurrentTrackDetailState>;
  @useResult
  $Res call({String artistName, String trackTitle});
}

/// @nodoc
class _$CurrentTrackDetailStateCopyWithImpl<$Res,
        $Val extends CurrentTrackDetailState>
    implements $CurrentTrackDetailStateCopyWith<$Res> {
  _$CurrentTrackDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? trackTitle = null,
  }) {
    return _then(_value.copyWith(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      trackTitle: null == trackTitle
          ? _value.trackTitle
          : trackTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentTrackDetailStateImplCopyWith<$Res>
    implements $CurrentTrackDetailStateCopyWith<$Res> {
  factory _$$CurrentTrackDetailStateImplCopyWith(
          _$CurrentTrackDetailStateImpl value,
          $Res Function(_$CurrentTrackDetailStateImpl) then) =
      __$$CurrentTrackDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String artistName, String trackTitle});
}

/// @nodoc
class __$$CurrentTrackDetailStateImplCopyWithImpl<$Res>
    extends _$CurrentTrackDetailStateCopyWithImpl<$Res,
        _$CurrentTrackDetailStateImpl>
    implements _$$CurrentTrackDetailStateImplCopyWith<$Res> {
  __$$CurrentTrackDetailStateImplCopyWithImpl(
      _$CurrentTrackDetailStateImpl _value,
      $Res Function(_$CurrentTrackDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? trackTitle = null,
  }) {
    return _then(_$CurrentTrackDetailStateImpl(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      trackTitle: null == trackTitle
          ? _value.trackTitle
          : trackTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrentTrackDetailStateImpl implements _CurrentTrackDetailState {
  _$CurrentTrackDetailStateImpl({this.artistName = '', this.trackTitle = ''});

  @override
  @JsonKey()
  final String artistName;
  @override
  @JsonKey()
  final String trackTitle;

  @override
  String toString() {
    return 'CurrentTrackDetailState(artistName: $artistName, trackTitle: $trackTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentTrackDetailStateImpl &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.trackTitle, trackTitle) ||
                other.trackTitle == trackTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, artistName, trackTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentTrackDetailStateImplCopyWith<_$CurrentTrackDetailStateImpl>
      get copyWith => __$$CurrentTrackDetailStateImplCopyWithImpl<
          _$CurrentTrackDetailStateImpl>(this, _$identity);
}

abstract class _CurrentTrackDetailState implements CurrentTrackDetailState {
  factory _CurrentTrackDetailState(
      {final String artistName,
      final String trackTitle}) = _$CurrentTrackDetailStateImpl;

  @override
  String get artistName;
  @override
  String get trackTitle;
  @override
  @JsonKey(ignore: true)
  _$$CurrentTrackDetailStateImplCopyWith<_$CurrentTrackDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentProgressBarState {
  int get currentProgress => throw _privateConstructorUsedError;
  int get totalProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentProgressBarStateCopyWith<CurrentProgressBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentProgressBarStateCopyWith<$Res> {
  factory $CurrentProgressBarStateCopyWith(CurrentProgressBarState value,
          $Res Function(CurrentProgressBarState) then) =
      _$CurrentProgressBarStateCopyWithImpl<$Res, CurrentProgressBarState>;
  @useResult
  $Res call({int currentProgress, int totalProgress});
}

/// @nodoc
class _$CurrentProgressBarStateCopyWithImpl<$Res,
        $Val extends CurrentProgressBarState>
    implements $CurrentProgressBarStateCopyWith<$Res> {
  _$CurrentProgressBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentProgress = null,
    Object? totalProgress = null,
  }) {
    return _then(_value.copyWith(
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentProgressBarStateImplCopyWith<$Res>
    implements $CurrentProgressBarStateCopyWith<$Res> {
  factory _$$CurrentProgressBarStateImplCopyWith(
          _$CurrentProgressBarStateImpl value,
          $Res Function(_$CurrentProgressBarStateImpl) then) =
      __$$CurrentProgressBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentProgress, int totalProgress});
}

/// @nodoc
class __$$CurrentProgressBarStateImplCopyWithImpl<$Res>
    extends _$CurrentProgressBarStateCopyWithImpl<$Res,
        _$CurrentProgressBarStateImpl>
    implements _$$CurrentProgressBarStateImplCopyWith<$Res> {
  __$$CurrentProgressBarStateImplCopyWithImpl(
      _$CurrentProgressBarStateImpl _value,
      $Res Function(_$CurrentProgressBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentProgress = null,
    Object? totalProgress = null,
  }) {
    return _then(_$CurrentProgressBarStateImpl(
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      totalProgress: null == totalProgress
          ? _value.totalProgress
          : totalProgress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CurrentProgressBarStateImpl implements _CurrentProgressBarState {
  _$CurrentProgressBarStateImpl(
      {this.currentProgress = 0, this.totalProgress = 30});

  @override
  @JsonKey()
  final int currentProgress;
  @override
  @JsonKey()
  final int totalProgress;

  @override
  String toString() {
    return 'CurrentProgressBarState(currentProgress: $currentProgress, totalProgress: $totalProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentProgressBarStateImpl &&
            (identical(other.currentProgress, currentProgress) ||
                other.currentProgress == currentProgress) &&
            (identical(other.totalProgress, totalProgress) ||
                other.totalProgress == totalProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentProgress, totalProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentProgressBarStateImplCopyWith<_$CurrentProgressBarStateImpl>
      get copyWith => __$$CurrentProgressBarStateImplCopyWithImpl<
          _$CurrentProgressBarStateImpl>(this, _$identity);
}

abstract class _CurrentProgressBarState implements CurrentProgressBarState {
  factory _CurrentProgressBarState(
      {final int currentProgress,
      final int totalProgress}) = _$CurrentProgressBarStateImpl;

  @override
  int get currentProgress;
  @override
  int get totalProgress;
  @override
  @JsonKey(ignore: true)
  _$$CurrentProgressBarStateImplCopyWith<_$CurrentProgressBarStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentPlayerPlayPauseBtnState {
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isPaused => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentPlayerPlayPauseBtnStateCopyWith<CurrentPlayerPlayPauseBtnState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentPlayerPlayPauseBtnStateCopyWith<$Res> {
  factory $CurrentPlayerPlayPauseBtnStateCopyWith(
          CurrentPlayerPlayPauseBtnState value,
          $Res Function(CurrentPlayerPlayPauseBtnState) then) =
      _$CurrentPlayerPlayPauseBtnStateCopyWithImpl<$Res,
          CurrentPlayerPlayPauseBtnState>;
  @useResult
  $Res call({bool isPlaying, bool isPaused, bool isLoading});
}

/// @nodoc
class _$CurrentPlayerPlayPauseBtnStateCopyWithImpl<$Res,
        $Val extends CurrentPlayerPlayPauseBtnState>
    implements $CurrentPlayerPlayPauseBtnStateCopyWith<$Res> {
  _$CurrentPlayerPlayPauseBtnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? isPaused = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentPlayerPlayPauseBtnStateImplCopyWith<$Res>
    implements $CurrentPlayerPlayPauseBtnStateCopyWith<$Res> {
  factory _$$CurrentPlayerPlayPauseBtnStateImplCopyWith(
          _$CurrentPlayerPlayPauseBtnStateImpl value,
          $Res Function(_$CurrentPlayerPlayPauseBtnStateImpl) then) =
      __$$CurrentPlayerPlayPauseBtnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPlaying, bool isPaused, bool isLoading});
}

/// @nodoc
class __$$CurrentPlayerPlayPauseBtnStateImplCopyWithImpl<$Res>
    extends _$CurrentPlayerPlayPauseBtnStateCopyWithImpl<$Res,
        _$CurrentPlayerPlayPauseBtnStateImpl>
    implements _$$CurrentPlayerPlayPauseBtnStateImplCopyWith<$Res> {
  __$$CurrentPlayerPlayPauseBtnStateImplCopyWithImpl(
      _$CurrentPlayerPlayPauseBtnStateImpl _value,
      $Res Function(_$CurrentPlayerPlayPauseBtnStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? isPaused = null,
    Object? isLoading = null,
  }) {
    return _then(_$CurrentPlayerPlayPauseBtnStateImpl(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CurrentPlayerPlayPauseBtnStateImpl
    implements _CurrentPlayerPlayPauseBtnState {
  _$CurrentPlayerPlayPauseBtnStateImpl(
      {this.isPlaying = false, this.isPaused = false, this.isLoading = false});

  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final bool isPaused;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CurrentPlayerPlayPauseBtnState(isPlaying: $isPlaying, isPaused: $isPaused, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPlayerPlayPauseBtnStateImpl &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPlaying, isPaused, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPlayerPlayPauseBtnStateImplCopyWith<
          _$CurrentPlayerPlayPauseBtnStateImpl>
      get copyWith => __$$CurrentPlayerPlayPauseBtnStateImplCopyWithImpl<
          _$CurrentPlayerPlayPauseBtnStateImpl>(this, _$identity);
}

abstract class _CurrentPlayerPlayPauseBtnState
    implements CurrentPlayerPlayPauseBtnState {
  factory _CurrentPlayerPlayPauseBtnState(
      {final bool isPlaying,
      final bool isPaused,
      final bool isLoading}) = _$CurrentPlayerPlayPauseBtnStateImpl;

  @override
  bool get isPlaying;
  @override
  bool get isPaused;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CurrentPlayerPlayPauseBtnStateImplCopyWith<
          _$CurrentPlayerPlayPauseBtnStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioPlayerOtherBtnState {
  bool get isNextTrackAvailable => throw _privateConstructorUsedError;
  bool get isPrevTrackAvailable => throw _privateConstructorUsedError;
  bool get isRepeatModeEnabled => throw _privateConstructorUsedError;
  bool get isShuffleModeEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlayerOtherBtnStateCopyWith<AudioPlayerOtherBtnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerOtherBtnStateCopyWith<$Res> {
  factory $AudioPlayerOtherBtnStateCopyWith(AudioPlayerOtherBtnState value,
          $Res Function(AudioPlayerOtherBtnState) then) =
      _$AudioPlayerOtherBtnStateCopyWithImpl<$Res, AudioPlayerOtherBtnState>;
  @useResult
  $Res call(
      {bool isNextTrackAvailable,
      bool isPrevTrackAvailable,
      bool isRepeatModeEnabled,
      bool isShuffleModeEnabled});
}

/// @nodoc
class _$AudioPlayerOtherBtnStateCopyWithImpl<$Res,
        $Val extends AudioPlayerOtherBtnState>
    implements $AudioPlayerOtherBtnStateCopyWith<$Res> {
  _$AudioPlayerOtherBtnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNextTrackAvailable = null,
    Object? isPrevTrackAvailable = null,
    Object? isRepeatModeEnabled = null,
    Object? isShuffleModeEnabled = null,
  }) {
    return _then(_value.copyWith(
      isNextTrackAvailable: null == isNextTrackAvailable
          ? _value.isNextTrackAvailable
          : isNextTrackAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrevTrackAvailable: null == isPrevTrackAvailable
          ? _value.isPrevTrackAvailable
          : isPrevTrackAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isRepeatModeEnabled: null == isRepeatModeEnabled
          ? _value.isRepeatModeEnabled
          : isRepeatModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isShuffleModeEnabled: null == isShuffleModeEnabled
          ? _value.isShuffleModeEnabled
          : isShuffleModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioPlayerOtherBtnStateImplCopyWith<$Res>
    implements $AudioPlayerOtherBtnStateCopyWith<$Res> {
  factory _$$AudioPlayerOtherBtnStateImplCopyWith(
          _$AudioPlayerOtherBtnStateImpl value,
          $Res Function(_$AudioPlayerOtherBtnStateImpl) then) =
      __$$AudioPlayerOtherBtnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isNextTrackAvailable,
      bool isPrevTrackAvailable,
      bool isRepeatModeEnabled,
      bool isShuffleModeEnabled});
}

/// @nodoc
class __$$AudioPlayerOtherBtnStateImplCopyWithImpl<$Res>
    extends _$AudioPlayerOtherBtnStateCopyWithImpl<$Res,
        _$AudioPlayerOtherBtnStateImpl>
    implements _$$AudioPlayerOtherBtnStateImplCopyWith<$Res> {
  __$$AudioPlayerOtherBtnStateImplCopyWithImpl(
      _$AudioPlayerOtherBtnStateImpl _value,
      $Res Function(_$AudioPlayerOtherBtnStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNextTrackAvailable = null,
    Object? isPrevTrackAvailable = null,
    Object? isRepeatModeEnabled = null,
    Object? isShuffleModeEnabled = null,
  }) {
    return _then(_$AudioPlayerOtherBtnStateImpl(
      isNextTrackAvailable: null == isNextTrackAvailable
          ? _value.isNextTrackAvailable
          : isNextTrackAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrevTrackAvailable: null == isPrevTrackAvailable
          ? _value.isPrevTrackAvailable
          : isPrevTrackAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isRepeatModeEnabled: null == isRepeatModeEnabled
          ? _value.isRepeatModeEnabled
          : isRepeatModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isShuffleModeEnabled: null == isShuffleModeEnabled
          ? _value.isShuffleModeEnabled
          : isShuffleModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AudioPlayerOtherBtnStateImpl implements _AudioPlayerOtherBtnState {
  _$AudioPlayerOtherBtnStateImpl(
      {this.isNextTrackAvailable = false,
      this.isPrevTrackAvailable = false,
      this.isRepeatModeEnabled = false,
      this.isShuffleModeEnabled = false});

  @override
  @JsonKey()
  final bool isNextTrackAvailable;
  @override
  @JsonKey()
  final bool isPrevTrackAvailable;
  @override
  @JsonKey()
  final bool isRepeatModeEnabled;
  @override
  @JsonKey()
  final bool isShuffleModeEnabled;

  @override
  String toString() {
    return 'AudioPlayerOtherBtnState(isNextTrackAvailable: $isNextTrackAvailable, isPrevTrackAvailable: $isPrevTrackAvailable, isRepeatModeEnabled: $isRepeatModeEnabled, isShuffleModeEnabled: $isShuffleModeEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioPlayerOtherBtnStateImpl &&
            (identical(other.isNextTrackAvailable, isNextTrackAvailable) ||
                other.isNextTrackAvailable == isNextTrackAvailable) &&
            (identical(other.isPrevTrackAvailable, isPrevTrackAvailable) ||
                other.isPrevTrackAvailable == isPrevTrackAvailable) &&
            (identical(other.isRepeatModeEnabled, isRepeatModeEnabled) ||
                other.isRepeatModeEnabled == isRepeatModeEnabled) &&
            (identical(other.isShuffleModeEnabled, isShuffleModeEnabled) ||
                other.isShuffleModeEnabled == isShuffleModeEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNextTrackAvailable,
      isPrevTrackAvailable, isRepeatModeEnabled, isShuffleModeEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioPlayerOtherBtnStateImplCopyWith<_$AudioPlayerOtherBtnStateImpl>
      get copyWith => __$$AudioPlayerOtherBtnStateImplCopyWithImpl<
          _$AudioPlayerOtherBtnStateImpl>(this, _$identity);
}

abstract class _AudioPlayerOtherBtnState implements AudioPlayerOtherBtnState {
  factory _AudioPlayerOtherBtnState(
      {final bool isNextTrackAvailable,
      final bool isPrevTrackAvailable,
      final bool isRepeatModeEnabled,
      final bool isShuffleModeEnabled}) = _$AudioPlayerOtherBtnStateImpl;

  @override
  bool get isNextTrackAvailable;
  @override
  bool get isPrevTrackAvailable;
  @override
  bool get isRepeatModeEnabled;
  @override
  bool get isShuffleModeEnabled;
  @override
  @JsonKey(ignore: true)
  _$$AudioPlayerOtherBtnStateImplCopyWith<_$AudioPlayerOtherBtnStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
