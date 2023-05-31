import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_list/track_list_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/ui/component/SongListItemView.dart';

class SongListScreen extends StatelessWidget {
  final String? trackId;

  const SongListScreen({required this.trackId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrackListCubit(),
      child: BlocBuilder<TrackListCubit, UiState<TrackListState>>(
          builder: (context, state) {
        // Todo : Find the best way to call Cubit or else Use Bloc with Events.
        TrackListCubit().loadTrackList(trackId ?? "");

        print(" TrackList  ${state is Success ?(state as Success).data.tracks.itemList : "Nothing"} ");

        return state is Success
            ? ListView.builder(
                itemCount: (state as Success).data.tracks.itemList.length,
                itemBuilder: (context, index) {
                  var currentItem =
                      (state as Success).data.tracks.itemList[index];
                  return SongListItemView(
                    // imageUrl: currentItem.thumbnailUrl,
                    // songName: currentItem.durationInMs.toString(),
                    artistName: currentItem.artist.toString(),
                    isPlaying: false,
                    onTap: () {
                      // Navigate to the SongPlay Screen
                    },
                  );
                })
            : const Text("Failure");
      }),
    );
  }
}
