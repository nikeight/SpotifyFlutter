import 'AlbumDataModel.dart';

class SpotifyMultipleAlbumDataModel {
  List<AlbumsDataModel>? albums;

  SpotifyMultipleAlbumDataModel({this.albums});

  SpotifyMultipleAlbumDataModel.fromJson(Map<String, dynamic> json) {
    if (json['albums'] != null) {
      albums = <AlbumsDataModel>[];
      json['albums'].forEach((v) {
        albums!.add(AlbumsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albums != null) {
      data['albums'] = albums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
