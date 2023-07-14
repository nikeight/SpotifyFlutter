part of 'spotify_carousel_host_cubit.dart';

class SpotifyCarouselHostState {
  List<ItemUiModel> trackItemList;
  int currentIndex;

  SpotifyCarouselHostState(this.trackItemList, this.currentIndex);

  factory SpotifyCarouselHostState.loading() =>
      SpotifyCarouselHostState(List.empty(), 0);
}
