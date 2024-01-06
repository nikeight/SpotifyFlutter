import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/bloc/audio_player_manager_bloc.dart';
import 'package:praxis_flutter/features/song_play/bloc/audio_player_manager_state.dart';
import 'package:praxis_flutter/features/song_play/song_detail_widget.dart';
import 'package:praxis_flutter/models/ui_state.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => AudioPlayerManagerBloc(),
        child: BlocListener<AudioPlayerManagerBloc,
                AudioPlayerManagerBlocState>(

            /// In the Listener we will manage all the Out of State scope methods
            /// Like SnackBar, Dialog showing and other events.
            listener: (context, state) {
              if (state is Success) {
                const snackBar = SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.check_box_rounded, color: Colors.green),
                      Text(
                        "Album added to favourites",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                      )
                    ],
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color(0xff344D67),
                  elevation: 2,
                  margin: EdgeInsets.only(
                      left: 48, right: 48, top: 16, bottom: 16),
                  dismissDirection: DismissDirection.endToStart,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const SongPlayDetailWidget()));
  }
}
