import 'package:praxis_data/models/spotify_data_model/album/TrackDataModel.dart';

import 'ArtistDataModel.dart';
import 'CopyrightDataModel.dart';
import 'ExternalIdDataModel.dart';
import 'ExternalUrlDataModel.dart';
import 'ImagesDataModel.dart';

class AlbumsDataModel {
  String? albumGroup;
  String? albumType;
  List<ArtistDataModel>? artists;
  List<String>? availableMarkets;
  List<CopyRightDataModel>? copyrights;
  ExternalIdDataModel? externalIds;
  ExternalUrlDataModel? externalUrls;
  String? href;
  String? id;
  List<ImageDataModel>? images;
  String? label;
  String? name;
  int? popularity;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  TrackDataModel? tracks;
  String? type;
  String? uri;

  AlbumsDataModel(
      {this.albumGroup,
      this.albumType,
      this.artists,
      this.availableMarkets,
      this.copyrights,
      this.externalIds,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.label,
      this.name,
      this.popularity,
      this.releaseDate,
      this.releaseDatePrecision,
      this.totalTracks,
      this.tracks,
      this.type,
      this.uri});

  AlbumsDataModel.fromJson(Map<String, dynamic> json) {
    albumGroup = json['album_group'];
    albumType = json['album_type'];
    if (json['artists'] != null) {
      artists = <ArtistDataModel>[];
      json['artists'].forEach((v) {
        artists!.add(ArtistDataModel.fromJson(v));
      });
    }
    availableMarkets = json['available_markets'].cast<String>();
    if (json['copyrights'] != null) {
      copyrights = <CopyRightDataModel>[];
      json['copyrights'].forEach((v) {
        copyrights!.add(CopyRightDataModel.fromJson(v));
      });
    }
    externalIds = json['external_ids'] != null
        ? ExternalIdDataModel.fromJson(json['external_ids'])
        : null;
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
    label = json['label'];
    name = json['name'];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    tracks =
        json['tracks'] != null ? TrackDataModel.fromJson(json['tracks']) : null;
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['album_group'] = this.albumGroup;
    data['album_type'] = this.albumType;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['available_markets'] = this.availableMarkets;
    if (this.copyrights != null) {
      data['copyrights'] = this.copyrights!.map((v) => v.toJson()).toList();
    }
    if (this.externalIds != null) {
      data['external_ids'] = this.externalIds!.toJson();
    }
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['label'] = this.label;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    data['total_tracks'] = this.totalTracks;
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}
