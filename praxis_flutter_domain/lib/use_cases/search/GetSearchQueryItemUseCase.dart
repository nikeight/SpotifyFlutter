import 'dart:async';

import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/SearchItemDm.dart';
import 'package:praxis_flutter_domain/repositories/SpotifySearchRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';


class GetSearchQueryItemUseCase extends UseCase<List<SearchItemDm>, String> {
  final SpotifySearchRepository spotifySearchRepository;

  GetSearchQueryItemUseCase(this.spotifySearchRepository);

  @override
  Future<Stream<List<SearchItemDm>?>> buildUseCaseStream(String? params) async {
    final streamController = StreamController<List<SearchItemDm>?>();
    try {
      final searchQueryResponse = await spotifySearchRepository.searchQuery("sunflower");
      if (searchQueryResponse is Success) {
        final searchItemList = (searchQueryResponse as Success).data as List<SearchItemDm>;
        if (searchItemList.isNotEmpty) {
          streamController.add(searchItemList);
        } else {
          streamController.addError(Exception("Null List"));
        }
      }
    } on Exception catch (e, _) {
      streamController.addError(Exception("Exception : $e -> Null Album List"));
    }
    return streamController.stream;
  }
}