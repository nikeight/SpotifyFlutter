class ExternalIdDataModel {
  String? upc;

  ExternalIdDataModel({this.upc});

  ExternalIdDataModel.fromJson(Map<String, dynamic> json) {
    upc = json['upc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['upc'] = upc;
    return data;
  }
}