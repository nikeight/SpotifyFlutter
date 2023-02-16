import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/models/album/album_response.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/models/album/model/dt_song_list.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_data/sources/network/common/url.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';

@injectable
class RandomTopAlbumDataSource {
  final CustomApiClient customDioApiClient;

  RandomTopAlbumDataSource(this.customDioApiClient);

  Future<ApiResponse<DtSongList>?> getTopRandomAlbums() async {
    try {
      final apiResponse = await customDioApiClient.getRequest(
          URL.iTunesTopAlbumsUrl, null, null);
      if (apiResponse != null) {
        var dtSongList = DtSongList([]);
        MusicResponse albumResponse =
            MusicResponse.fromJson(json.decode(apiResponse));
        albumResponse.feed?.entry?.forEach((element) {
          var dtSongObject = DtSong(
              int.parse(element.id?.attributes?.imid ?? "0"),
              element.imname?.label,
              element.imartist?.label,
              element.imimage?[2].label,
              false);
          dtSongList.add(dtSongObject);
        });
        return Success(data: dtSongList);
      } else {
        return Failure(error: Exception("Empty Response 404"));
      }
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
