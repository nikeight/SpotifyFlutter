import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/album/TrackDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/category/SpotifyCategoryResponseDataModel.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

abstract class SpotifyDatasource {
  Future<ApiResponse<SpotifyMultipleAlbumDataModel>> getMultipleAlbums();
  Future<ApiResponse<TrackDataModel>> getSingleAlbumTracks(String trackId);
  Future<ApiResponse<SpotifyCategoryResponseDataModel>> getSpotifySearchCategories();
  Future<ApiResponse<TrackDataModel>> spotifySearch(String query);
}
