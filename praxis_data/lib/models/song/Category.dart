import 'Attributes.dart';

class Category {
  Category({
      this.attributes,});

  Category.fromJson(dynamic json) {
    attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  Attributes? attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (attributes != null) {
      map['attributes'] = attributes?.toJson();
    }
    return map;
  }
}