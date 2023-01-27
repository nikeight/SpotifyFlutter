class Price {
  Price({
      this.label,});

  Price.fromJson(dynamic json) {
    label = json['label'];
  }

  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    return map;
  }

}