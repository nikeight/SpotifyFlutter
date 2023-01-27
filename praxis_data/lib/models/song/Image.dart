class Image {
  Image({
      this.label,});

  Image.fromJson(dynamic json) {
    label = json['label'];
  }

  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    return map;
  }

}