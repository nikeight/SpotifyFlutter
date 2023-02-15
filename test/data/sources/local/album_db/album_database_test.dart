import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/sources/local/album_db/album_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockAlbumDatabase extends Mock implements AlbumDatabase {}

class MockDtSong extends Mock implements DtSong {}

const String TEST_ALBUM_DB_TABLE_NAME = "test_album_table";

void main() {
  late Database sqfDatabase;
  late MockAlbumDatabase sut;

  DtSong fakeDtSongOb = DtSong(
      1, "Discovery", "Daft Punk", "https://daftpunk/discovery.png", false);

  List<DtSong> fakeListDtSong = List.generate(
      5,
      (index) => DtSong(1 + index, "Discovery", "Daft Punk",
          "https://daftpunk/discovery.png", false));

  setUpAll(() async {
    registerFallbackValue(MockDtSong());
    sqfliteFfiInit();
    sqfDatabase = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    // TODO : Avoid creating a DB table and use Testing rules for the same
    // Better ways to approach the same.

    await sqfDatabase.execute("""
      CREATE TABLE $TEST_ALBUM_DB_TABLE_NAME (
      ${SpotifyDbSongsField.album_primary_id} integer primary key autoincrement,
      ${SpotifyDbSongsField.album_name} TEXT NOT NULL,
      ${SpotifyDbSongsField.album_title} TEXT NOT NULL,
      ${SpotifyDbSongsField.album_image_url} TEXT NOT NULL,
      ${SpotifyDbSongsField.album_is_fav} INTEGER NOT NULL
      )
      """);
    sut = MockAlbumDatabase();
    sut.albumDatabase = sqfDatabase;
  });

  group("album database test", () {
    test("check sqflite database version", () async {
      sqfDatabase.setVersion(1);
      when(() => sut.getDatabaseVersion()).thenAnswer((_) async => 1);
      expect(await sqfDatabase.getVersion(), await sqfDatabase.getVersion());
    });

    test("item inserted at db successfully", () async {
      var isItemInjected = await sqfDatabase.insert(TEST_ALBUM_DB_TABLE_NAME, fakeDtSongOb.toMap());
      when(() => sut.insertToSpotifyDb(any())).thenAnswer((invocation) async => true);
      expect(isItemInjected, 1);
    });

    test("item retrieved from db successfully", () async {
      fakeListDtSong.forEach((dtSongObj) {
        sqfDatabase.insert(TEST_ALBUM_DB_TABLE_NAME, dtSongObj.toMap());
      });
      final testAlbumList = await sqfDatabase.query(TEST_ALBUM_DB_TABLE_NAME);
      when(() => sut.getAllAlbums()).thenAnswer((invocation) async => fakeListDtSong);
      expect(testAlbumList.length, fakeListDtSong.length);
    });
  });
}
