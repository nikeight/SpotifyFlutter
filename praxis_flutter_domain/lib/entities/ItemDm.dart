class ItemDm {
  final String itemId;
  final String artist;
  final int durationInMs;
  final String hrefMp3;
  final String thumbnailUrl;
  final String shareUri;

  ItemDm({
    required this.itemId,
    required this.artist,
    required this.durationInMs,
    required this.hrefMp3,
    required this.thumbnailUrl,
    required this.shareUri,
  });
}
