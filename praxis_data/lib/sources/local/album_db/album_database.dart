import 'package:injectable/injectable.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String _albumDatabaseName = "spotify.db";
const String _albumTableName = "album_table";

@singleton
class AlbumDatabase {
  Database? _albumDatabase;

  AlbumDatabase();

  Future<Database> _initDatabase(String filePath) async {
    final defaultDatabasePath = await getDatabasesPath();
    final albumDatabasePath = join(defaultDatabasePath, filePath);
    return await openDatabase(albumDatabasePath,
        version: 1, onCreate: _createAlbumDatabase);
  }

  Future _createAlbumDatabase(Database database, int version) async {
    const primaryId = "TEXT PRIMARY KEY";
    const albumName = "TEXT NOT NULL";
    const albumTitle = "TEXT NOT NULL";
    const albumSongUrl = "TEXT NOT NULL";
    const albumIsFav = "BOOLEAN NOT NULL";
    await database.execute("""
      CREATE TABLE $_albumTableName (
      ${SpotifyDbSongsField.album_primary_id} $primaryId,
      ${SpotifyDbSongsField.album_name} $albumName,
      ${SpotifyDbSongsField.album_title} $albumTitle,
      ${SpotifyDbSongsField.album_image_url} $albumSongUrl,
      ${SpotifyDbSongsField.album_is_fav} $albumIsFav,
      )
      """);
  }

  Future<Database> get database async {
    if (_albumDatabase != null) return _albumDatabase!;
    _albumDatabase = await _initDatabase(_albumDatabaseName);
    return _albumDatabase!;
  }

  Future<bool> insertToSpotifyDb(DtSong song) async {
    final db = await database;
    return await db.insert(_albumTableName, song.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace) >
        0;
  }

  Future<bool> deleteAllJokes() async {
    final db = await database;
    return await db.delete(_albumTableName) > 0;
  }

  Future<List<DtSong>> getAllAlbums() async {
    final db = await database;
    final albumMapList = await db.query(_albumTableName);
    final List<DtSong> jokeList =
        albumMapList.map((jokeMap) => DtSong.dtSongFromJson(jokeMap)).toList();
    return jokeList;
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
