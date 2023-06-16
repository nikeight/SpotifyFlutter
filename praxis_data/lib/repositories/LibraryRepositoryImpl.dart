import 'package:praxis_data/mapper/AlbumModellMapper.dart';
import 'package:praxis_data/mapper/TrackDataDomainMapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/SpotifyMultipleAlbumDataModel.dart';
import 'package:praxis_data/sources/network/source/spotify_data_source.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/repositories/LibraryRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';

@Injectable(as: LibraryRepository)
class LibraryRepositoryImpl extends LibraryRepository {
  final SpotifyDatasource datasource;
  final AlbumModelMapper albumModelMapper;
  final TrackDataDomainMapper trackDataDomainMapper;

  LibraryRepositoryImpl(
      this.datasource, this.albumModelMapper, this.trackDataDomainMapper);

  @override
  Future<ApiResponse<List<AlbumDm>>> fetchData() async {
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
  Future<List<AlbumDm>> fetchFavouriteSongs() {
    // TODO: implement fetchFavouriteSongs
    throw UnimplementedError();
  }

  @override
  Future<List<AlbumDm>> fetchPlayList() {
    // TODO: implement fetchPlayList
    throw UnimplementedError();
  }

  @override
  Future<List<AlbumDm>> fetchPodCasts() {
    // TODO: implement fetchPodCasts
    throw UnimplementedError();
  }
}
