import 'package:praxis_flutter/models/ArtistUiModel.dart';
import 'package:praxis_flutter/models/TrackUiModel.dart';

class AlbumUiModel {
  final ArtistUiModel artist;
  final String label;
  final String thumbnailImageUrl;
  final TrackUiModel tracks;
  final String albumId;

  AlbumUiModel({
    required this.artist,
    required this.label,
    required this.thumbnailImageUrl,
    required this.tracks,
    required this.albumId
  });
}

List<String> randomSpotifyCoverPages = [
"https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b7fd92108782021.5fc5820ec90ba.png",
  "https://i.pinimg.com/236x/08/9e/4b/089e4b6788e6b1faa98e07829f06ae33--close-my-eyes-song-list.jpg",
  "https://i.pinimg.com/236x/f5/51/7c/f5517cb156cf4176e929137e3363c08d.jpg",
  "https://mir-s3-cdn-cf.behance.net/project_modules/hd/f5a34e108782021.5fc5820ec88bf.png",
  "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/45ea84108782021.5fc5820ec84a0.png"
];