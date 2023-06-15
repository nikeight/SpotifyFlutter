import 'package:praxis_data/models/spotify_data_model/album/ArtistDataModel.dart';
import 'package:praxis_data/models/spotify_data_model/album/ExternalUrlDataModel.dart';
import 'ImagesDataModel.dart';

class SearchQueryItemDataModel {
  String? albumType;
  List<ArtistDataModel>? artists;
  List<String>? availableMarkets;
  ExternalUrlDataModel? externalUrls;
  String? href;
  String? id;
  List<ImageDataModel>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  SearchQueryItemDataModel(
      {this.albumType,
        this.artists,
        this.availableMarkets,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.releaseDate,
        this.releaseDatePrecision,
        this.totalTracks,
        this.type,
        this.uri});

  SearchQueryItemDataModel.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    if (json['artists'] != null) {
      artists = <ArtistDataModel>[];
      json['artists'].forEach((v) {
        artists!.add(ArtistDataModel.fromJson(v));
      });
    }
    availableMarkets = json['available_markets'].cast<String>();
    externalUrls = json['external_urls'] != null
        ? ExternalUrlDataModel.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <ImageDataModel>[];
      json['images'].forEach((v) {
        images!.add(ImageDataModel.fromJson(v));
      });
    }
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['album_type'] = albumType;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    data['available_markets'] = availableMarkets;
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['release_date'] = releaseDate;
    data['release_date_precision'] = releaseDatePrecision;
    data['total_tracks'] = totalTracks;
    data['type'] = type;
    data['uri'] = uri;
    return data;
  }
}
