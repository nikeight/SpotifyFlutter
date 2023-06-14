import 'CategoryItemDataModel.dart';

class CategoryDataModel {
  String? href;
  List<CategoryItemDataModel>? items;
  int? limit;
  String? next;
  int? offset;
  int? previous;
  int? total;

  CategoryDataModel(
      {this.href,
        this.items,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <CategoryItemDataModel>[];
      json['items'].forEach((v) {
        items!.add(CategoryItemDataModel.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}