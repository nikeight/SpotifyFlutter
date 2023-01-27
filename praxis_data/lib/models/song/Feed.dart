import 'Author.dart';
import 'Entry.dart';
import 'Updated.dart';
import 'Icon.dart';

class Feed {
  Feed({
    this.author,
    this.entry,
    this.updated,
    this.icon,
  });

  Feed.fromJson(dynamic json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['entry'] != null) {
      entry = [];
      json['im:image'].forEach((v) {
        entry?.add(Entry.fromJson(v));
      });
    }
    updated =
        json['updated'] != null ? Updated.fromJson(json['updated']) : null;
    icon = json['icon'] != null ? Icon.fromJson(json['icon']) : null;
  }

  Author? author;
  List<Entry?>? entry;
  Updated? updated;
  Icon? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (author != null) {
      map['author'] = author?.toJson();
    }
    if (entry != null) {
      map['entry'] = entry?.map((v) => v?.toJson()).toList();
    }
    if (updated != null) {
      map['updated'] = updated?.toJson();
    }
    if (icon != null) {
      map['icon'] = icon?.toJson();
    }
    return map;
  }
}
