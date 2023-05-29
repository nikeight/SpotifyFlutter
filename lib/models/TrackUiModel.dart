import 'package:praxis_flutter/models/ItemUiModel.dart';

class TrackUiModel {
  final String href;
  final List<ItemUiModel> itemList;
  final int total;

  TrackUiModel({required this.itemList, required this.total, required this.href});
}