import 'Artist.dart';
import 'Image.dart';
import 'ItemCount.dart';
import 'Name.dart';
import 'Price.dart';
import 'ReleaseDate.dart';
import 'Rights.dart';
import 'Title.dart';
import 'Category.dart';

class Entry {
  Entry({
      this.imname, 
      this.imimage, 
      this.imitemCount, 
      this.imprice, 
      this.rights, 
      this.title, 
      this.imartist, 
      this.category, 
      this.imreleaseDate,});

  Entry.fromJson(dynamic json) {
    imname = json['im:name'] != null ? Name.fromJson(json['im:name']) : null;
    if (json['im:image'] != null) {
      imimage = [];
      json['im:image'].forEach((v) {
        imimage?.add(Image.fromJson(v));
      });
    }
    imitemCount = json['im:itemCount'] != null ? ItemCount.fromJson(json['im:itemCount']) : null;
    imprice = json['im:price'] != null ? Price.fromJson(json['im:price']) : null;
    rights = json['rights'] != null ? Rights.fromJson(json['rights']) : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    imartist = json['im:artist'] != null ? Artist.fromJson(json['im:artist']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    imreleaseDate = json['im:releaseDate'] != null ? ReleaseDate.fromJson(json['im:releaseDate']) : null;
  }

  Name? imname;
  List<Image>? imimage;
  ItemCount? imitemCount;
  Price? imprice;
  Rights? rights;
  Title? title;
  Artist? imartist;
  Category? category;
  ReleaseDate? imreleaseDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (imname != null) {
      map['im:name'] = imname?.toJson();
    }
    if (imimage != null) {
      map['im:image'] = imimage?.map((v) => v.toJson()).toList();
    }
    if (imitemCount != null) {
      map['im:itemCount'] = imitemCount?.toJson();
    }
    if (imprice != null) {
      map['im:price'] = imprice?.toJson();
    }
    if (rights != null) {
      map['rights'] = rights?.toJson();
    }
    if (title != null) {
      map['title'] = title?.toJson();
    }
    if (imartist != null) {
      map['im:artist'] = imartist?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (imreleaseDate != null) {
      map['im:releaseDate'] = imreleaseDate?.toJson();
    }
    return map;
  }

}