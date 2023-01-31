class Title {
  Title({
      this.label,});

  Title.fromJson(dynamic json) {
    label = json['label'];
  }
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    return map;
  }

}