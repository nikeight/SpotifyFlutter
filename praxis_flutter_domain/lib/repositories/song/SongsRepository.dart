import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';

abstract class SongsRepository {
  Future<ApiResponse<SongsWithListType>> getRandomSongList();
  Future<ApiResponse<SongsWithListType>> getAllCachedFavSongs();
}
