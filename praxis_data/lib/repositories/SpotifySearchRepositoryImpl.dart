import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/SearchQueryDataDomainMapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/SearchQueryResponse.dart';
import 'package:praxis_data/models/spotify_data_model/category/SpotifyCategoryResponseDataModel.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_flutter_domain/entities/CategoryDm.dart';
import 'package:praxis_flutter_domain/entities/SearchItemDm.dart';
import 'package:praxis_flutter_domain/repositories/SpotifySearchRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';
import '../mapper/CategoryDataDomainMapper.dart';
import '../sources/network/source/spotify_data_source.dart';

@Injectable(as: SpotifySearchRepository)
class SpotifySearchRepositoryImpl extends SpotifySearchRepository {
  final CustomApiClient apiClient;
  final SpotifyDatasource datasource;
  final CategoryDataDomainMapper categoryDataDomainMapper;
  final SearchQueryDataDomainMapper searchQueryDataDomainMapper;

  SpotifySearchRepositoryImpl(this.apiClient, this.datasource,
      this.categoryDataDomainMapper, this.searchQueryDataDomainMapper);

  @override
  Future<ApiResponse> getCachedRecentSearchHistory() {
    // TODO: implement getCachedRecentSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<CategoryDm>>> getSpotifyCategories() async {
    final multipleAlbumResponse = await datasource.getSpotifySearchCategories();

    List<CategoryDm> categoryDm = [];

    if (multipleAlbumResponse is Success) {
      final spotifySearchCategoryResponse = (multipleAlbumResponse as Success)
          .data as SpotifyCategoryResponseDataModel;

      spotifySearchCategoryResponse.categories?.items?.forEach((element) {
        categoryDm.add(categoryDataDomainMapper.mapToDomain(element));
      });

      return Success(data: categoryDm);
    } else if (multipleAlbumResponse is Failure) {
      return Failure(error: (multipleAlbumResponse as Failure).error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }

  @override
  Future<ApiResponse<List<SearchItemDm>>> searchQuery(String query) async {
    final searchQueryResponse = await datasource.spotifySearch(query);

    List<SearchItemDm> searchItemList = [];
    if (searchQueryResponse is Success) {
      final spotifySearchCategoryResponse =
          (searchQueryResponse as Success).data as SearchQueryResponse;

      spotifySearchCategoryResponse.albums?.items?.forEach((e) {
            searchItemList.add(searchQueryDataDomainMapper.mapToDomain(e));
          });

      return Success(data: searchItemList);
    } else if (searchQueryResponse is Failure) {
      return Failure(error: (searchQueryResponse as Failure).error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }
}
