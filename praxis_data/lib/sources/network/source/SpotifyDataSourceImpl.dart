import 'package:praxis_data/models/spotify_data_model/access_token/SpotifyAccessTokenResponse.dart';
import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_data/sources/network/source/spotify_data_source.dart';

class SpotifyDataSourceImpl extends SpotifyDatasource {
  final CustomApiClient customDioApiClient;

  SpotifyDataSourceImpl(this.customDioApiClient);

  @override
  Future<SpotifyAccessTokenDataModel> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<SpotifyMultipleAlbumDataModel> getMultipleAlbums() {
    // TODO: implement getMultipleAlbums
    throw UnimplementedError();
  }

  @override
  Future<String> getSingleAlbumTracks() {
    // TODO: implement getSingleAlbumTracks
    throw UnimplementedError();
  }

  @override
  Future<SpotifyMultipleAlbumDataModel> getSingleAlbums() {
    // TODO: implement getSingleAlbums
    throw UnimplementedError();
  }
}
