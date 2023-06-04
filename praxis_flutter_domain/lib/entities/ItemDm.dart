class ItemDm {
  final String itemId;
  final String artist;
  final String trackName;
  final int durationInMs;
  final String hrefMp3;
  final String shareUri;

  ItemDm({
    required this.itemId,
    required this.artist,
    required this.trackName,
    required this.durationInMs,
    required this.hrefMp3,
    required this.shareUri,
  });
}
