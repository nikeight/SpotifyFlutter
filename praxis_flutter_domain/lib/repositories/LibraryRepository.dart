import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

abstract class LibraryRepository{
  Future<List<AlbumDm>> fetchFavouriteSongs();
  Future<List<AlbumDm>> fetchPlayList();
  Future<List<AlbumDm>> fetchPodCasts();
  Future<ApiResponse<List<AlbumDm>>> fetchData();
}