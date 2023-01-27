class Attributes {
  Attributes({
      this.imid,
      this.term,
      this.scheme,
      this.label,});

  Attributes.fromJson(dynamic json) {
    imid = json['im:id'];
    term = json['term'];
    scheme = json['scheme'];
    label = json['label'];
  }
  String? imid = '';
  String? term = '';
  String? scheme = '';
  String? label = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['im:id'] = imid;
    map['term'] = term;
    map['scheme'] = scheme;
    map['label'] = label;
    return map;
  }

}