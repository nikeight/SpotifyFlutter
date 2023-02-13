import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/sources/local/album_db/album_database.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockAlbumDatabase extends Mock implements AlbumDatabase{}

void main() {
  late Database sqfDatabase;
  late MockAlbumDatabase mockAlbumDatabase;

  DtSong fakeDtSongOb = DtSong(
      1, "Discovery", "Daft Punk", "htps://daftpunk/discovery.png", false);

  List<DtSong> fakeListDtSong = List.generate(
      5,
      (index) => DtSong(1 + index, "Discovery", "Daft Punk",
          "htps://daftpunk/discovery.png", false));

  setUpAll(() async {
    sqfliteFfiInit();
    sqfDatabase = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    // await sqfDatabase.execute(databaseRules);
    mockAlbumDatabase = MockAlbumDatabase();
    mockAlbumDatabase.albumDatabase = sqfDatabase;
    when(() => mockAlbumDatabase.insertToSpotifyDb(any())).thenAnswer((invocation) async => true);
    when(() => mockAlbumDatabase.getAllAlbums()).thenAnswer((invocation) async => fakeListDtSong);
  });

  group("album database test", () {
    test("check sqflite database version", () async {
    when(() => sqfDatabase.getVersion()).thenAnswer((_) async => 1);
      expect(await sqfDatabase.getVersion(), 1);
    });

    test("add data model to database", () async {
      var isItemInjected =
          await sqfDatabase.insert("album_table", fakeDtSongOb.toMap());
      var getItems = await sqfDatabase.query("album_table");
      expect(getItems.length, equals(isItemInjected));
    });
  });
}
