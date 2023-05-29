import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/song_play/song_detail_widget.dart';
import 'package:praxis_flutter/features/song_play/song_play_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';

class SongDetailScreen extends StatelessWidget {

  const SongDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (_) => SongPlayCubit(),
        child: BlocListener<SongPlayCubit, UiState<bool>>(
            listener: (context, state) {
              if (state is Success) {
                final snackBar = SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
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
                  duration: const Duration(seconds: 2),
                  backgroundColor: const Color(0xff344D67),
                  elevation: 2,
                  margin: const EdgeInsets.only(
                      left: 48, right: 48, top: 16, bottom: 16),
                  dismissDirection: DismissDirection.endToStart,
                  behavior: SnackBarBehavior.floating,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const SongPlayDetailWidget()));
  }
}
