class ImageDataModel {
  int? height;
  String? url;
  int? width;

  ImageDataModel({this.height, this.url, this.width});

  ImageDataModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['height'] = height;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}