class CopyRightDataModel {
  String? text;
  String? type;

  CopyRightDataModel({this.text, this.type});

  CopyRightDataModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    return data;
  }
}