import 'package:praxis_flutter/ui/model/ui_model.dart';

class SongUiModel extends UIModel {
  final String songPosterUrl;
  final String songName;
  final String songAuthor;

  SongUiModel(
    this.songName,
    this.songAuthor, {
    required this.songPosterUrl,
  });
}

class UiSongsList extends UIModel {
  List<SongUiModel> songsList;

  UiSongsList(this.songsList);
}
