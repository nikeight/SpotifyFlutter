import 'ArtistDm.dart';
import 'TrackDm.dart';

class AlbumDm {
  final ArtistDm artist;
  final String label;
  final String thumbnailImageUrl;
  final TrackDm tracks;
  final String albumId;

  AlbumDm({
    required this.artist,
    required this.label,
    required this.thumbnailImageUrl,
    required this.tracks,
    required this.albumId
  });
}
