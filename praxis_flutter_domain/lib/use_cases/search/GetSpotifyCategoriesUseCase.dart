import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_flutter_domain/entities/CategoryDm.dart';
import 'package:praxis_flutter_domain/repositories/SpotifySearchRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

class GetSpotifyCategoriesUseCase extends UseCase<List<CategoryDm>, String> {
  final SpotifySearchRepository spotifySearchRepository;

  GetSpotifyCategoriesUseCase(this.spotifySearchRepository);

  @override
  Future<Stream<List<CategoryDm>?>> buildUseCaseStream(String? params) async {
    final streamController = StreamController<List<CategoryDm>?>();
    try {
      final multipleCategoryResponse =
          await spotifySearchRepository.getSpotifyCategories();
      if (multipleCategoryResponse is Success) {
        final multipleCategory =
            (multipleCategoryResponse as Success).data as List<CategoryDm>;
        if (multipleCategoryResponse != null) {
          streamController.add(multipleCategory);
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
