import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/entities/CategoryDm.dart';
import 'package:praxis_flutter_domain/entities/SearchItemDm.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

abstract class SpotifySearchRepository{
  Future<ApiResponse<List<CategoryDm>>> getSpotifyCategories();

  Future<ApiResponse<List<SearchItemDm>>> searchQuery(String query);

  Future<ApiResponse> getCachedRecentSearchHistory();
}