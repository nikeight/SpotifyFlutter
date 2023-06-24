import 'SearchQueryItemDataModel.dart';

class SearchQueryAlbumDataModel {
  String? href;
  List<SearchQueryItemDataModel>? items;
  int? limit;
  String? next;
  int? offset;
  int? previous;
  int? total;

  SearchQueryAlbumDataModel(
      {this.href,
        this.items,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total});

  SearchQueryAlbumDataModel.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <SearchQueryItemDataModel>[];
      json['items'].forEach((v) {
        items!.add(SearchQueryItemDataModel.fromJson(v));
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
    data['href'] = href;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = limit;
    data['next'] = next;
    data['offset'] = offset;
    data['previous'] = previous;
    data['total'] = total;
    return data;
  }
}