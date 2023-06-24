import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/spotify_data_model/album/AlbumDataModel.dart';
import 'package:praxis_flutter_domain/entities/AlbumDm.dart';
import 'package:praxis_flutter_domain/entities/ArtistDm.dart';
import 'package:praxis_flutter_domain/entities/ItemDm.dart';
import 'package:praxis_flutter_domain/entities/TrackDm.dart';

@injectable
class AlbumModelMapper extends EntityMapper<AlbumDm, AlbumsDataModel> {
  @override
  AlbumsDataModel mapToData(AlbumDm model) {
    // TODO: implement mapToData
    throw UnimplementedError();
  }

  @override
  AlbumDm mapToDomain(AlbumsDataModel entity) {
    final artist = ArtistDm(
      artistName: entity.artists?.first.name ?? "empty_artist_name",
      artistId: entity.artists?.first.id ?? "empty_id",
      artistUri: entity.artists?.first.uri ?? "empty_uri",
      artistHref: entity.artists?.first.href ?? "empty_href_link",
    );

    final List<ItemDm> itemTrackList = [];

    entity.tracks?.items?.forEach((element) {
      final ItemDm itemDm = ItemDm(
          itemId: entity.id ?? "",
          artist: element.artists?.first.name ?? "artist_name_empty",
          trackName: element.name ?? "track_name",
          durationInMs: element.durationMs ?? 0,
          hrefMp3: element.previewUrl ?? "empty_mp3_url",
          shareUri: element.href ?? "empty_href_endpoint"
      );

      itemTrackList.add(itemDm);
    });

    final tracks = TrackDm(
        itemList: itemTrackList,
        total: entity.tracks?.total ?? 0,
        href: entity.tracks?.href ?? "empty_href_endpoint");

    return AlbumDm(
      artist: artist,
      label: entity.name ?? "empty_label",
      thumbnailImageUrl: entity.images?.first.url ?? "empty_image_url",
      tracks: tracks,
      albumId: entity.id ?? "empty_id",
    );
  }
}