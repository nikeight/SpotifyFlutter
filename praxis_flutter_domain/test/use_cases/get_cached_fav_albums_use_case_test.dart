import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_flutter_domain/entities/song/dm_song_list.dart';
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart';
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart';

class MockDataSongRepository extends Mock implements SongsRepository {}

void main() {
  late final GetCachedFavAlbumUseCase sut;
  late final MockDataSongRepository repository;

  setUpAll(() async {
    repository = MockDataSongRepository();
    sut = GetCachedFavAlbumUseCase(repository);
  });

  group("cached data usecase test group", () {
    test("get domain model list, if data available at local database",
        () async {
      when(() => repository.getAllCachedFavSongs())
          .thenAnswer((invocation) async => SongsWithListType(songList: []));
      sut.perform((event) {
        if (event != null) {
          expect(event.songList, SongsWithListType(songList: []));
        }
      }, (error) {}, () {});
    });

    test("get null list, if data not available at local database", () async {
      when(() => repository.getAllCachedFavSongs())
          .thenAnswer((invocation) async => null);
      sut.perform((event) {
        if (event == null) {
          expect(event, null);
        }
      }, (error) {}, () {});
    });

    test("exception caught at time of migration", () async {
      when(() => repository.getAllCachedFavSongs())
          .thenThrow(Exception("Migration under process"));
      sut.perform((event) {}, (error) {
        expect(error, Exception("Migration under process"));
      }, () {});
    });
  });
}
