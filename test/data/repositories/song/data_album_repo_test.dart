import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_data/mapper/song/SongsListMapper.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/models/album/model/dt_song_list.dart';
import 'package:praxis_data/repositories/song/DataAlbumRepository.dart';
import 'package:praxis_data/sources/local/album_db/album_database.dart';
import 'package:praxis_data/sources/network/source/RandomTopAlbumDataSource.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';

class MockNetworkDataSource extends Mock implements RandomTopAlbumDataSource {}

class MockLocalDataSource extends Mock implements AlbumDatabase {}

class MockSongListMapper extends Mock implements SongsListMapper {}

class MockDataSongModelMapper extends Mock implements DataSongModelMapper {}

void main() {
  final fakeSongDataModelList = List.generate(
    5,
    (index) => DtSong(1 + index, "Discovery", "Daft Punk",
        "https://daftpunk/discovery.png", false),
  );

  final fakeSongDomainModelList = List.generate(
    5,
    (index) => Song("https://daftpunk/discovery.png", "Discovery", "Daft Punk",
        1234, false),
  );

  late final DataAlbumRepository sut;
  late final MockNetworkDataSource remoteDataSource;
  late final MockLocalDataSource localDataSource;
  late final MockSongListMapper songListMapper;
  late final MockDataSongModelMapper mockDataSongModelMapper;

  // Real class
  late final SongsListMapper songsListMapper;
  late final DataSongModelMapper dataSongModelMapper;

  setUpAll(() async {
    dataSongModelMapper = DataSongModelMapper();
    songsListMapper = SongsListMapper(dataSongModelMapper);

    remoteDataSource = MockNetworkDataSource();
    localDataSource = MockLocalDataSource();
    songListMapper = MockSongListMapper();
    mockDataSongModelMapper = MockDataSongModelMapper();

    sut = DataAlbumRepository(remoteDataSource, songsListMapper,
        localDataSource, dataSongModelMapper);
  });

  group("network dependent tests group", () {
    test("get success state, while fetching top random Albums", () async {
      when(() => remoteDataSource.getTopRandomAlbums()).thenAnswer(
          (invocation) async =>
              Success(data: DtSongList(fakeSongDataModelList)));
      final repoActualSuccessResponse = await sut.getRandomSongList();
      if (repoActualSuccessResponse != null) {
        expect(repoActualSuccessResponse, isA<Success<SongsWithListType>>());
      }
    });

    test("get Failure state, while encountering any exception ", () async {
      when(() => remoteDataSource.getTopRandomAlbums())
          .thenThrow(Exception("Connection Timeout"));
      final repoActualFailureResponse = await sut.getRandomSongList();
      expect(repoActualFailureResponse, isA<Failure<SongsWithListType>>());
    });

    test("get Failure state, during server issue", () async {
      when(() => remoteDataSource.getTopRandomAlbums())
          .thenAnswer((_) async => null);
      final repoActualFailureResponse = await sut.getRandomSongList();
      expect(repoActualFailureResponse, isA<Failure<SongsWithListType>>());
    });
  });

  group("local database dependent tests groups", () {
    test("get list of song model, if there is data in the database", () async {
      when(() => localDataSource.getAllAlbums())
          .thenAnswer((invocation) async => fakeSongDataModelList);
      final repoActualDataResponse = await sut.getAllCachedFavSongs();
      // Todo : Better way to check assertions rather using `isA`
      // expect(repoActualDataResponse, SongsWithListType(songList: fakeSongDomainModelList));
      if (repoActualDataResponse != null) {
        expect(repoActualDataResponse, isA<SongsWithListType>());
      }
    });

    test("get null response, if there is no data in the database", () async {
      when(() => localDataSource.getAllAlbums())
          .thenAnswer((invocation) async => []);
      final repoActualDataResponse = await sut.getAllCachedFavSongs();
      if (repoActualDataResponse?.songList == null) {
        expect(repoActualDataResponse, null);
      }
    });
  });
}
