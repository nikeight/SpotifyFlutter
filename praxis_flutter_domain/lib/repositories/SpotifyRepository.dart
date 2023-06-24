import 'dart:async';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/entities/ArtistDm.dart';
import 'package:praxis_flutter_domain/entities/TrackDm.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

abstract class SpotifyRepository {
  Future<ApiResponse<String>> getActiveAccessToken();

  Future<ApiResponse<List<AlbumDm>>> getCachedAlbumList(List<String> albumIds);

  Future<ApiResponse<TrackDm>> getAlbumTracksList(String albumId);

  Future<ApiResponse<TrackDm>> getTrackDetails(int trackId);

  Future<ApiResponse<AlbumDm>> getPlayLists();
}
