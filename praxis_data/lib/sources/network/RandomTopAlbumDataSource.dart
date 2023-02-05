import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:praxis_data/models/album/album_response.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/models/album/model/dt_song_list.dart';
import 'package:praxis_data/sources/network/url.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';

@injectable
class RandomTopAlbumDataSource {
  final httpDioClient = Dio();

  Future<ApiResponse<DtSongList>?> getTopRandomAlbums() async {
    try {
      final apiResponse = await httpDioClient.get(URL.iTunesTopAlbumsUrl);
      if (apiResponse.data != null) {
        var dtSongList = DtSongList([]); 
        MusicResponse albumResponse = MusicResponse.fromJson(json.decode(apiResponse.data));
        albumResponse.feed?.entry?.forEach((element) {
          var dtSongObject = DtSong(123, element.imname?.label,
              element.imartist?.label, element.imimage?[0].label, false);
          dtSongList.add(dtSongObject);
        });
        return Success(data: dtSongList);
      }else{
        return Failure(error: Exception("Empty Response 404"));
      }
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
