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
