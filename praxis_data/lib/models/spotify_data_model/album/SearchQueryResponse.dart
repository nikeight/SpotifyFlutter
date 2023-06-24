import 'package:praxis_data/models/spotify_data_model/album/SearchQueryAlbumDataModel.dart';

class SearchQueryResponse {
  SearchQueryAlbumDataModel? albums;

  SearchQueryResponse({this.albums});

  SearchQueryResponse.fromJson(Map<String, dynamic> json) {
    albums =
    json['albums'] != null ? SearchQueryAlbumDataModel.fromJson(json['albums']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albums != null) {
      data['albums'] = albums!.toJson();
    }
    return data;
  }
}
