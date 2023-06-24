import 'package:praxis_data/models/spotify_data_model/category/CategoryIconDataModel.dart';

class CategoryItemDataModel {
  String? href;
  List<CategoryIconDataModel>? icons;
  String? id;
  String? name;

  CategoryItemDataModel({this.href, this.icons, this.id, this.name});

  CategoryItemDataModel.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['icons'] != null) {
      icons = <CategoryIconDataModel>[];
      json['icons'].forEach((v) {
        icons!.add(CategoryIconDataModel.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['href'] = this.href;
    if (this.icons != null) {
      data['icons'] = this.icons!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
