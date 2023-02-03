import 'package:injectable/injectable.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/models/album/model/dt_song_list.dart';
import 'package:praxis_data/sources/network/RandomTopAlbumDataSource.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';
import '../../mapper/song/SongsListMapper.dart';
import '../../sources/local/album_db/album_database.dart';

@Injectable(as: SongsRepository)
class DataAlbumRepository extends SongsRepository {
  final RandomTopAlbumDataSource _randomTopAlbumDataSource;
  final SongsListMapper mapper;
  final DataSongModelMapper modelMapper;
  final AlbumDatabase albumDatabase;

  DataAlbumRepository(this._randomTopAlbumDataSource, this.mapper,
      this.albumDatabase, this.modelMapper);

  @override
  Future<ApiResponse<SongsWithListType>> getRandomSongList() async {
    var response = await _randomTopAlbumDataSource.getTopRandomAlbums();
    if (response != null) {
      var domainModel = (response as Success).data as DtSongList;
      return Success(data: mapper.mapToDomain(domainModel));
    } else {
      return Failure(error: Exception("Null values"));
    }
  }

  @override
  Future<SongsWithListType?> getAllCachedFavSongs() async {
    var dummyData =
        DtSong(1, "AlbumName", "ArtistName", "a_dummy_img_url", false);
    var isItemInsertedSuccessfully =
        await albumDatabase.insertToSpotifyDb(dummyData);
    if (isItemInsertedSuccessfully) {
      final cachedData = await albumDatabase.getAllAlbums();
      print("Repo Method called $cachedData");
      if (cachedData.isNotEmpty) {
        return mapper.mapToDomain(DtSongList(cachedData));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<bool> toggleFavAlbumAtDb(Song song) async {
    return await albumDatabase.insertToSpotifyDb(modelMapper.mapToData(song));
  }
}
