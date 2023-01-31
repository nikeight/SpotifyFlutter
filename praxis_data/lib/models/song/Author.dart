import 'Uri.dart';

class Author {
  Author({
      this.uri,});

  Author.fromJson(dynamic json) {
    uri = json['uri'] != null ? Uri.fromJson(json['uri']) : null;
  }

  Uri? uri = Uri(label: "");

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (uri != null) {
      map['uri'] = uri?.toJson();
    }
    return map;
  }

}