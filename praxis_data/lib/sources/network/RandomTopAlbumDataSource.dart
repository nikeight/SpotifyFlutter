import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:praxis_data/models/song/TopAlbumResponse.dart';
import 'package:praxis_data/models/song/model/dt_song.dart';
import 'package:praxis_data/models/song/model/dt_song_list.dart';
import 'package:praxis_data/sources/network/url.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';

@injectable
class RandomTopAlbumDataSource {
  final httpDioClient = Dio();

  Future<ApiResponse<DtSongList>?> getTopRandomAlbums() async {
    try {
      DtSongList dtSongList = DtSongList(null);
      final apiResponse = await httpDioClient.get(URL.iTunesTopAlbumsUrl);
      if (apiResponse.data != null) {
        TopAlbumResponse albumResponse =
            TopAlbumResponse.fromJson(apiResponse.data);
        albumResponse.feed?.entry?.forEach((element) {
          var dtSongObject = DtSong(element?.imname?.label,
              element?.imimage?[0].label, element?.imartist?.label);

          dtSongList.add(dtSongObject);
        });
      }
      return Success(data: dtSongList);
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
