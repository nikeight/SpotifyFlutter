import 'ExternalUrlDataModel.dart';

class ArtistDataModel {
  ExternalUrlDataModel? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  ArtistDataModel(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  ArtistDataModel.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? ExternalUrlDataModel.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}