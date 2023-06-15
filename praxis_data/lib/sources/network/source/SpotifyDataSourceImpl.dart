import 'package:injectable/injectable.dart';
import 'package:praxis_data/models/spotify_data_model/album/SearchQueryResponse.dart';
import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/album/TrackDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/category/SpotifyCategoryResponseDataModel.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_data/sources/network/source/spotify_data_source.dart';
import 'package:praxis_data/utils/HttpRequestType.dart';
import 'package:praxis_data/utils/safe_api_network_call_response.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/spotify_api.dart';

@Injectable(as: SpotifyDatasource)
class SpotifyDataSourceImpl extends SpotifyDatasource {
  final CustomApiClient customDioApiClient;
  final SharedPreferences sharedPreference;

  SpotifyDataSourceImpl(this.customDioApiClient, this.sharedPreference);

  @override
  Future<ApiResponse<SpotifyMultipleAlbumDataModel>> getMultipleAlbums() async {
    // Multiple Album id. 6jk3ucx33D7CLURgcfVFOT [EXTRA ID FOR LATER USAGE ]
    const albumId =
        "2cUzlmLfL5LUTSEk7qG09k,4yh5pn9VghfFn3ejC4p8MP,4ONIL6w6cUj2ArNYM6V4CL,5xjaz957o6YGSXmlfd2tex,6FC95PYKFrO8UYhjCidPZ9,1IwC3SdQXPgXSs8FLvOUju";

    final multipleAlbumResponse = await safeApiCallHandler(
        customDioApiClient,
        HttpRequestType.GET,
        get_single_album_endpoint(albumId),
        sharedPreference,
        null);

    if (multipleAlbumResponse is Success) {
      final spotifySingleAlbumModelResponse =
          SpotifyMultipleAlbumDataModel.fromJson(multipleAlbumResponse.data);

      return Success(data: spotifySingleAlbumModelResponse);
    } else if (multipleAlbumResponse is Failure) {
      return Failure(error: multipleAlbumResponse.error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }

  @override
  Future<ApiResponse<TrackDataModel>> getSingleAlbumTracks(
      String trackId) async {
    final tracksAlbumResponse = await safeApiCallHandler(
        customDioApiClient,
        HttpRequestType.GET,
        get_album_tracks_endpoint(trackId),
        sharedPreference,
        null);

    if (tracksAlbumResponse is Success) {
      final tracksResponse = TrackDataModel.fromJson(tracksAlbumResponse.data);

      return Success(data: tracksResponse);
    } else if (tracksAlbumResponse is Failure) {
      return Failure(error: tracksAlbumResponse.error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }

  @override
  Future<ApiResponse<SpotifyCategoryResponseDataModel>>
      getSpotifySearchCategories() async {
    final spotifyCategoryListResponse = await safeApiCallHandler(
        customDioApiClient,
        HttpRequestType.GET,
        get_spotify_search_categories_endpoint,
        sharedPreference,
        null);

    if (spotifyCategoryListResponse is Success) {
      final spotifyCategoryData = SpotifyCategoryResponseDataModel.fromJson(
          spotifyCategoryListResponse.data);

      return Success(data: spotifyCategoryData);
    } else if (spotifyCategoryListResponse is Failure) {
      return Failure(error: spotifyCategoryListResponse.error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }

  @override
  Future<ApiResponse<SearchQueryResponse>> spotifySearch(String query) async {
    final spotifySearchResponse = await safeApiCallHandler(
      customDioApiClient,
      HttpRequestType.GET,
      get_spotify_search_endpoint(),
      sharedPreference,
      null,
    );

    if (spotifySearchResponse is Success) {
      final spotifySearchData =
          SearchQueryResponse.fromJson(spotifySearchResponse.data);

      return Success(data: spotifySearchData);
    } else if (spotifySearchResponse is Failure) {
      return Failure(error: spotifySearchResponse.error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }
}
