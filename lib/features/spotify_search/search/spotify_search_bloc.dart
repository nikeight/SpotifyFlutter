import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:praxis_flutter/models/SearchItemUiModel.dart';
import 'package:praxis_flutter_domain/entities/SearchItemDm.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';
import 'package:praxis_flutter_domain/use_cases/search/GetSearchQueryItemUseCase.dart';

import '../../../mapper/SearchItemUiMapper.dart';

part 'spotify_search_event.dart';

part 'spotify_search_state.dart';

class SpotifySearchBloc extends Bloc<SpotifySearchEvent, SpotifySearchState> {

  final getSearchItemListUseCase = GetIt.I.get<GetSearchQueryItemUseCase>();
  final searchItemUiMapper = GetIt.I.get<SearchItemUiMapper>();

  SpotifySearchBloc() : super(SpotifySearchInitial()) {
    on<SpotifySearchEvent>(
      (event, emit) => _fetchSearchResults(event, emit),
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 500))
            .asyncExpand(mapper);
      },
    );
  }

  Future<void> _fetchSearchResults(
      SpotifySearchEvent event, Emitter<SpotifySearchState> emit) async {
    getSearchItemListUseCase.perform((List<SearchItemDm>? response) {
      final List<SearchItemUiModel> searchQueryItemList = [];
      if (response != null && response.isNotEmpty) {
        for (var element in response) {
          searchQueryItemList.add(searchItemUiMapper.mapToUiModel(element));
        }
        emit(SpotifySearchQueryResultState(searchQueryItemList));
      } else {
        print("Response is empty");
        emit(SpotifySearchQueryResultState(List.empty()));
      }
    }, (e) {}, () {});
  }
}
