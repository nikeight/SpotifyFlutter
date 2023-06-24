import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/AlbumModellMapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/album/TrackDataModel.dart';
import 'package:praxis_data/sources/network/source/spotify_data_source.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/entities/TrackDm.dart';
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

import '../mapper/TrackDataDomainMapper.dart';

@Injectable(as: SpotifyRepository)
class SpotifyHomeRepositoryImpl extends SpotifyRepository {
  final SpotifyDatasource datasource;
  final AlbumModelMapper albumModelMapper;
  final TrackDataDomainMapper trackDataDomainMapper;

  SpotifyHomeRepositoryImpl(
      this.datasource, this.albumModelMapper, this.trackDataDomainMapper);

  @override
  Future<ApiResponse<String>> getActiveAccessToken() async {
    // var responseData = await dataSource.getAccessToken();
    // if (responseData is Success) {
    //   var accessTokenModel =
    //       (responseData as Success).data as SpotifyAccessTokenDataModel;
    //   final String freshAccessToken = accessTokenModel.accessToken ?? " ";
    // } else if (responseData is Failure) {
    //   return Failure(error: Exception((responseData as Failure).error));
    // } else {
    //   return Failure(error: Exception("Something went Wrong"));
    // }
    return Success(data: "empty_refresh_token_generated");
  }

  @override
  Future<ApiResponse<TrackDm>> getAlbumTracksList(String albumId) async {
    final multipleTrackItemResponse =
        await datasource.getSingleAlbumTracks(albumId);

    if (multipleTrackItemResponse is Success) {
      final spotifyTrackDataModel =
          (multipleTrackItemResponse as Success).data as TrackDataModel;

      return Success(
          data: trackDataDomainMapper.mapToDomain(spotifyTrackDataModel));
    } else if (multipleTrackItemResponse is Failure) {
      return Failure(error: (multipleTrackItemResponse as Failure).error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }

  @override
  Future<ApiResponse<List<AlbumDm>>> getCachedAlbumList(
      List<String> albumIds) async {
    final multipleAlbumResponse = await datasource.getMultipleAlbums();

    // Creating an empty list
    final List<AlbumDm> albumList = [];

    if (multipleAlbumResponse is Success) {
      final spotifyAlbumDataModel = (multipleAlbumResponse as Success).data
          as SpotifyMultipleAlbumDataModel;

      spotifyAlbumDataModel.albums?.forEach((element) {
        final albumDomainModel = albumModelMapper.mapToDomain(element);
        albumList.add(albumDomainModel);
      });

      return Success(data: albumList);
    } else if (multipleAlbumResponse is Failure) {
      return Failure(error: (multipleAlbumResponse as Failure).error);
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  }

  @override
  Future<ApiResponse<AlbumDm>> getPlayLists() {
    // TODO: implement getPlayLists
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TrackDm>> getTrackDetails(int trackId) {
    // TODO: implement getTrackDetails
    throw UnimplementedError();
  }
}
