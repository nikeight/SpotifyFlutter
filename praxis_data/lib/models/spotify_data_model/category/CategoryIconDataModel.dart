class CategoryIconDataModel {
  int? height;
  String? url;
  int? width;

  CategoryIconDataModel({this.height, this.url, this.width});

  CategoryIconDataModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}