import 'Feed.dart';

class TopAlbumResponse {
  TopAlbumResponse({
      this.feed,});

  TopAlbumResponse.fromJson(dynamic json) {
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
  }
  Feed? feed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (feed != null) {
      map['feed'] = feed?.toJson();
    }
    return map;
  }
}