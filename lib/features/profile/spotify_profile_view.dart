import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/profile/spotify_profile_cubit.dart';
import '../../models/ui_state.dart';

class SpotifyProfileScreen extends StatelessWidget {
  const SpotifyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifyProfileCubit, UiState<String>>(
      builder: (context, state) {
        print("STATE : $state");
        return state is Success
            ? Text((state as Success).data)
            : state is Failure
                ? const Text("Failure State")
                : state is Initial
                    ? const CircularProgressIndicator()
                    : const Text("Else State");
      },
    );
  }
}
