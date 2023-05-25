import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_data/sources/network/source/spotify_data_source.dart';
import 'package:praxis_data/utils/HttpRequestType.dart';
import 'package:praxis_data/utils/safe_api_network_call_response.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/spotify_api.dart';

@Injectable(as: SpotifyDatasource)
class SpotifyDataSourceImpl extends SpotifyDatasource {

  final CustomApiClient customDioApiClient;

  SpotifyDataSourceImpl(this.customDioApiClient);

  final SharedPreferences sharedPreference = GetIt.I.get<SharedPreferences>();

  @override
  Future<ApiResponse<SpotifyMultipleAlbumDataModel>> getMultipleAlbums() async {

    // // Multiple Album id.
    // const albumId =
    //     "382ObEPsp2rxGrnsizN5TX,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc";
    //
    // final multipleAlbumResponse = await safeApiCallHandler(
    //   customDioApiClient,
    //   HttpRequestType.GET,
    //   get_single_album_endpoint(albumId),
    //   sharedPreference,
    //   null,
    // );
    //
    // if (multipleAlbumResponse is Success) {
    //   final spotifySingleAlbumModelResponse =
    //       SpotifyMultipleAlbumDataModel.fromJson(multipleAlbumResponse.data);
    //
    //   return Success(data: spotifySingleAlbumModelResponse);
    // } else if (multipleAlbumResponse is Failure) {
    //   return Failure(error: multipleAlbumResponse.error);
    // } else {
    //   return Failure(error: Exception("Something went wrong"));
    // }

    return Success(data: SpotifyMultipleAlbumDataModel(albums: List.empty()));
  }

  @override
  Future<ApiResponse<String>> getSingleAlbumTracks() {
    // TODO: implement getSingleAlbumTracks
    throw UnimplementedError();
  }
}
