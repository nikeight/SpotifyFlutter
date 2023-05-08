import 'package:praxis_data/models/spotify_data_model/access_token/SpotifyAccessTokenResponse.dart';
import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';

abstract class SpotifyDatasource {
  Future<SpotifyAccessTokenDataModel> getAccessToken();
  Future<SpotifyMultipleAlbumDataModel> getSingleAlbums();
  Future<SpotifyMultipleAlbumDataModel> getMultipleAlbums();
  Future<String> getSingleAlbumTracks();
}
