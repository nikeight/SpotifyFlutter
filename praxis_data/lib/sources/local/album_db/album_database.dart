import 'package:injectable/injectable.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String _albumDatabaseName = "spotify.db";
const String _albumTableName = "album_table";

@singleton
class AlbumDatabase {
  Database? albumDatabase;

  /*
    Todo : Use of private field of database
    Or to use named Constructor to pass the database from outside
    in Cases of tests.

   */
  // AlbumDatabase.test(Database db){
  //   albumDatabase = db;
  // }

  AlbumDatabase();

  Future<Database> _initDatabase(String filePath) async {
    final defaultDatabasePath = await getDatabasesPath();
    final albumDatabasePath = join(defaultDatabasePath, filePath);
    return await openDatabase(albumDatabasePath,
        version: 1, onCreate: _createAlbumDatabase);
  }

  Future _createAlbumDatabase(Database database, int version) async {
    const primaryId = "INTEGER PRIMARY KEY";
    const albumName = "TEXT NOT NULL";
    const albumTitle = "TEXT NOT NULL";
    const albumSongUrl = "TEXT NOT NULL";
    const albumIsFav = "INTEGER NOT NULL";
    await database.execute("""
      CREATE TABLE $_albumTableName (
      ${SpotifyDbSongsField.album_primary_id} $primaryId,
      ${SpotifyDbSongsField.album_name} $albumName,
      ${SpotifyDbSongsField.album_title} $albumTitle,
      ${SpotifyDbSongsField.album_image_url} $albumSongUrl,
      ${SpotifyDbSongsField.album_is_fav} $albumIsFav
      )
      """);
  }

  Future<Database> get database async {
    if (albumDatabase != null) return albumDatabase!;
    albumDatabase = await _initDatabase(_albumDatabaseName);
    return albumDatabase!;
  }

  Future<bool> insertToSpotifyDb(DtSong song) async {
    final db = await database;
    return await db.insert(_albumTableName, song.toMap()) > 0;
  }

  Future<bool> deleteAllJokes() async {
    final db = await database;
    return await db.delete(_albumTableName) > 0;
  }

  // Todo : Return empty list if there is no data in the database
  Future<List<DtSong>> getAllAlbums() async {
    final db = await database;
    final albumMapList = await db.query(_albumTableName);
    final jokeList = albumMapList.map((jokeMap) => DtSong.fromMap(jokeMap));
    return jokeList.toList();
  }

  Future close() async {
    final db = await database;
    db.close();
  }

  Future<int> getDatabaseVersion() async {
    final db = await database;
    return db.getVersion();
  }
}
