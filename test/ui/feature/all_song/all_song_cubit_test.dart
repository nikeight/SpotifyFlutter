import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_flutter/features/all_song/all_song_cubit.dart';
import 'package:praxis_flutter/di/injection.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/use_cases/get_random_song_list_usecase.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart'
    as api_response;

class MockGetTopRandomAlbumUseCase extends Mock
    implements GetRandomSongListUseCase {}

void main() {
  final successUseCaseResponse = GetRandomSongListResponse(
      randomSongList:
          api_response.Success(data: SongsWithListType(songList: [])));

  final failureUseCaseResponse = GetRandomSongListResponse(
      randomSongList:
          api_response.Failure(error: Exception("Something went wrong")));

  late final MockGetTopRandomAlbumUseCase useCase;
  late final AllSongCubit sut;

  setUpAll(() async {
    configureAppInjection(Environment.test);
    useCase = MockGetTopRandomAlbumUseCase();
    sut = AllSongCubit();
  });

  blocTest<AllSongCubit, UiState<AllSongUiStateDataClass>>(
    "Check initial loading state for allSongCubit",
    build: () => sut,
    setUp: () => when(() => useCase.perform((event) {}, (error) {}, () {}))
        .thenAnswer((invocation) {
      successUseCaseResponse;
    }),
    act: (cubit) => cubit.loadAlbums(),
    expect: () => [isA<Loading<AllSongUiStateDataClass>>()],
  );

  blocTest<AllSongCubit, UiState<AllSongUiStateDataClass>>(
    "Check success state when get success response from useCase",
    build: () => sut,
    setUp: () => when(() => useCase.perform((event) {}, (error) {}, () {}))
        .thenAnswer((invocation) {
      successUseCaseResponse;
    }),
    act: (cubit) => cubit.handleResponse(successUseCaseResponse),
    expect: () => [isA<Success<AllSongUiStateDataClass>>()],
  );

  blocTest<AllSongCubit, UiState<AllSongUiStateDataClass>>(
    "Check failure state when get failure response from useCase",
    build: () => sut,
    setUp: () => when(() => useCase.perform((event) {}, (error) {}, () {}))
        .thenAnswer((invocation) {
      failureUseCaseResponse;
    }),
    act: (cubit) => cubit.error(Exception("Something went wrong")),
    expect: () => [isA<Failure<AllSongUiStateDataClass>>()],
  );
}
