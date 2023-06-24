import 'package:praxis_data/models/spotify_data_model/category/CategoryDataModel.dart';

class SpotifyCategoryResponseDataModel {
  CategoryDataModel? categories;

  SpotifyCategoryResponseDataModel({this.categories});

  SpotifyCategoryResponseDataModel.fromJson(Map<String, dynamic> json) {
    categories = json['categories'] != null
        ? CategoryDataModel.fromJson(json['categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    return data;
  }
}
