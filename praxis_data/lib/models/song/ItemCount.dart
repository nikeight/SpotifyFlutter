class ItemCount {
  ItemCount({
      this.label,});

  ItemCount.fromJson(dynamic json) {
    label = json['label'];
  }
  
  int? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    return map;
  }

}