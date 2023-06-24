import 'ItemDm.dart';

class TrackDm {
  final String href;
  final List<ItemDm> itemList;
  final int total;

  TrackDm({required this.itemList, required this.total, required this.href});
}
